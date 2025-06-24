Detailed Installation Guide for Wazuh
This guide provides step-by-step instructions to install and configure Wazuh for a SOC-as-a-Service project.
Step 1: Preparation

Deploy an Ubuntu 22.04 LTS VM with 8 GB RAM, 2 vCPUs, 100 GB SSD.
Update the system:sudo apt update && sudo apt upgrade -y



Step 2: Installation via Script

Clone the repository:git clone https://github.com/<your-username>/wazuh-installation.git
cd wazuh-installation


Run the script:chmod +x scripts/install_wazuh.sh
sudo ./scripts/install_wazuh.sh



Step 3: Configuration

Apply Wazuh configuration:
Copy config/wazuh_config.yml to /var/ossec/etc/ossec.conf (merge manually).


Restart services:sudo systemctl restart wazuh-manager
sudo systemctl restart elasticsearch
sudo systemctl restart kibana



Step 4: Verification

Access Wazuh dashboard: https://<your-ip>:55000.
Check logs: /var/ossec/logs/wazuh-install.log.
Test log collection by installing a Wazuh agent on an endpoint:sudo apt install wazuh-agent
/var/ossec/bin/agent-auth -m <wazuh-manager-ip>



Step 5: Integration

Configure Filebeat to send logs to Elasticsearch.
Integrate with other tools (e.g., TheHive, MISP) via API.

Troubleshooting

Check logs: /var/ossec/logs/ossec.log, /var/log/elasticsearch/.
Refer to Wazuh Documentation.

Next Steps

Configure custom detection rules.
Integrate ML models for anomaly detection.
