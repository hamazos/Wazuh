# 📘 Guide d'Installation Détaillé – Wazuh pour SOC-as-a-Service

Ce guide fournit les instructions pas à pas pour **installer, configurer et vérifier** une instance **Wazuh** dans le cadre d’un projet **SOC-as-a-Service souverain**. L’objectif est de disposer rapidement d’un environnement prêt à l’emploi, intégrable avec des outils comme **TheHive**, **MISP** ou encore **Cortex**.

---

## 🧰 Étape 1 : Préparation de l’environnement

1. **Déployer une machine virtuelle Ubuntu 22.04 LTS** avec les caractéristiques suivantes :
   - **RAM** : 8 Go
   - **vCPU** : 2
   - **Disque** : 100 Go SSD

2. **Mettre à jour le système** :

```bash
sudo apt update && sudo apt upgrade -y
Installer les dépendances nécessaires :

bash
Copier
Modifier
sudo apt install curl apt-transport-https lsb-release gnupg2 -y
⚙️ Étape 2 : Installation via le script
Cloner ce dépôt :

git clone https://github.com/hamazos/Wazuh.git
cd Wazuh

Rendre le script exécutable et l’exécuter :
chmod +x scripts/install_wazuh.sh
sudo ./scripts/install_wazuh.sh

Le script installera automatiquement :

Wazuh Manager

Elasticsearch

Filebeat

Kibana

Configuration de base de Wazuh

🛠️ Étape 3 : Configuration manuelle (facultative)
Appliquer une configuration personnalisée :

Copier le fichier de configuration prérempli :


sudo cp config/wazuh_config.yml /var/ossec/etc/ossec.conf
🔁 Si vous avez déjà une configuration existante, fusionnez manuellement les sections nécessaires.

Redémarrer les services Wazuh :

sudo systemctl restart wazuh-manager
sudo systemctl restart elasticsearch
sudo systemctl restart kibana
🔍 Étape 4 : Vérification de l'installation
Accéder au tableau de bord Wazuh :

URL : https://<votre-ip>:55000

Identifiants par défaut :

admin / (mot de passe dans le fichier /var/ossec/logs/wazuh-install.log)

Vérifier les journaux d'installation :

cat /var/ossec/logs/wazuh-install.log
Tester la collecte de journaux via un agent (sur une machine cliente) :

sudo apt install wazuh-agent
sudo /var/ossec/bin/agent-auth -m <ip-du-wazuh-manager>
🔗 Étape 5 : Intégration avec d'autres outils
Configurer Filebeat pour envoyer les logs à Elasticsearch.

Intégrer Wazuh avec des outils tiers :

TheHive (via Wazuh alert forwarding → Cortex → TheHive)

MISP (enrichissement via API)

SOAR (Shuffle) pour l’automatisation des réponses

🔧 Voir le fichier docs/Integrations.md pour les détails.

🧯 Dépannage
Journaux utiles :

/var/ossec/logs/ossec.log (Wazuh)

/var/log/elasticsearch/ (Elasticsearch)

Documentation officielle :

Wazuh Documentation

🧠 Prochaines Étapes
✅ Personnaliser les règles de détection

🤖 Intégrer des modèles ML pour la détection d’anomalies

📊 Visualiser les événements sur Kibana avec des dashboards sur mesure

🔁 Déployer un pipeline de supervision continue

Ce guide fait partie intégrante d’un projet open source de cybersécurité visant à démocratiser la mise en place d’un SOC moderne, souverain et automatisé.

Auteur : Hamza Weslati
Date de dernière mise à jour : Juin 2025