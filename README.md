Wazuh Installation for SOC-as-a-Service
This repository provides scripts and documentation to install Wazuh, an open-source SIEM, as part of a sovereign SOC-as-a-Service project. Wazuh is used for log collection, threat detection, and alert generation, integrating with tools like TheHive and MISP.
Features

Automated installation of Wazuh Manager, Elasticsearch, Filebeat, and Kibana.
Initial configuration for log collection and threat detection.
Compatible with sovereign infrastructure (on-premise or OVHcloud/Scaleway).

Prerequisites

OS: Ubuntu Server 22.04 LTS.
Hardware: 8 GB RAM, 2 vCPUs, 100 GB SSD.
Network: Open ports 1514 (UDP), 1515 (TCP), 55000 (TCP), 9200/9300 (TCP).
Dependencies: curl, apt-transport-https, lsb-release, gnupg2.

Quick Start

Clone the repository:git clone https://github.com/<your-username>/wazuh-installation.git
cd wazuh-installation


Make the script executable:chmod +x scripts/install_wazuh.sh


Run the installation script:sudo ./scripts/install_wazuh.sh


Access Wazuh dashboard:
URL: https://<your-ip>:55000
Default credentials: admin / password in /var/ossec/logs/wazuh-install.log



Documentation

Detailed Installation Guide

License
This project is licensed under the MIT License.
Contributing
Contributions are welcome! Please see CONTRIBUTING.md for details.
Contact

Author: 
Email: hamza_weslati@live.fr
