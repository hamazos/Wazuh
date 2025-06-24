# 🛡️ Wazuh Installation for SOC-as-a-Service

Ce dépôt contient les **scripts d'installation** et la **documentation complète** pour déployer **Wazuh**, une solution SIEM open-source, dans le cadre d’un projet **SOC-as-a-Service souverain**. Ce projet vise à faciliter la mise en place d’un SOC (Security Operations Center) clé-en-main, s’intégrant avec des outils comme **TheHive**, **MISP** et **Cortex**.

---

## 🚀 Fonctionnalités

- 📦 Installation automatisée de :
  - **Wazuh Manager**
  - **Elasticsearch**
  - **Filebeat**
  - **Kibana**
- 🔐 Préconfiguration pour :
  - La collecte de journaux
  - La détection de menaces
  - La génération d’alertes
- 🌐 Compatible avec des infrastructures souveraines :
  - **On-Premise**
  - **Cloud public européen** (OVHcloud, Scaleway)

---

## ⚙️ Prérequis

| Élément      | Détail                                |
|--------------|----------------------------------------|
| **OS**       | Ubuntu Server **22.04 LTS**            |
| **RAM**      | Minimum **8 Go**                       |
| **CPU**      | Minimum **2 vCPUs**                    |
| **Stockage** | Minimum **100 Go SSD**                 |
| **Réseau**   | Ports à ouvrir : `1514/UDP`, `1515/TCP`, `55000/TCP`, `9200-9300/TCP` |
| **Dépendances** | `curl`, `apt-transport-https`, `lsb-release`, `gnupg2` |

---

## ⚡ Installation Rapide

1. **Cloner le dépôt :**

```bash
git clone https://github.com/ton-utilisateur/wazuh-installation.git
cd wazuh-installation
Rendre le script exécutable :

bash
Copier
Modifier
chmod +x scripts/install_wazuh.sh
Lancer l'installation :

bash
Copier
Modifier
sudo ./scripts/install_wazuh.sh
Accéder au tableau de bord Wazuh :

URL : https://<votre-ip>:55000

Identifiants par défaut :

Utilisateur : admin

Mot de passe : voir le fichier /var/ossec/logs/wazuh-install.log

📚 Documentation
Guide d'installation détaillé

Architecture recommandée pour SOC-as-a-Service

Intégration avec TheHive et MISP

🤝 Contribuer
Les contributions sont les bienvenues !
Veuillez consulter le fichier CONTRIBUTING.md pour plus d’informations.

📜 Licence
Ce projet est sous licence MIT – voir le fichier LICENSE pour plus de détails.

👤 Auteur
Nom : Hamza Weslati

Email : hamza_weslati@live.fr

LinkedIn : linkedin.com/in/hamza-weslati