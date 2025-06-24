#!/bin/bash
# Automated installation script for Wazuh on Ubuntu 22.04 LTS

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Update system
echo "Updating system..."
apt update && apt upgrade -y
apt install -y curl apt-transport-https lsb-release gnupg2

# Add Wazuh repository
echo "Adding Wazuh repository..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list
apt update

# Install Wazuh Manager
echo "Installing Wazuh Manager..."
apt install -y wazuh-manager

# Install Elasticsearch
echo "Installing Elasticsearch..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list
apt update
apt install -y elasticsearch

# Configure Elasticsearch
echo "Configuring Elasticsearch..."
sed -i 's/#network.host: 127.0.0.1/network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
systemctl enable elasticsearch
systemctl start elasticsearch

# Install Filebeat
echo "Installing Filebeat..."
apt install -y filebeat
curl -s https://packages.wazuh.com/4.x/filebeat/wazuh-filebeat-0.2.tar.gz | tar -xvz -C /usr/share/filebeat/module
filebeat modules enable wazuh
systemctl enable filebeat
systemctl start filebeat

# Install Kibana
echo "Installing Kibana..."
apt install -y kibana
sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/' /etc/kibana/kibana.yml
systemctl enable kibana
systemctl start kibana

# Install Wazuh Kibana plugin
echo "Installing Wazuh Kibana plugin..."
/usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.5.0_8.10.2-1.zip

# Start Wazuh Manager
echo "Starting Wazuh Manager..."
systemctl enable wazuh-manager
systemctl start wazuh-manager

# Generate credentials
echo "Generating Wazuh credentials..."
/var/ossec/bin/wazuh-control start
echo "Credentials saved in /var/ossec/logs/wazuh-install.log"

# Configure firewall
echo "Configuring firewall..."
ufw allow 1514/udp
ufw allow 1515/tcp
ufw allow 55000/tcp
ufw allow 9200/tcp
ufw allow 9300/tcp
ufw reload

echo "Installation complete! Access Wazuh at https://<your-ip>:55000"