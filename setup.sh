#!/bin/bash

exec > >(tee -a /var/log/script_setup.log) 2>&1

# Met à jour la liste des paquets disponibles
echo "Mise à jour des listes de paquets..."
sudo apt-get update

# Installe les paquets nécessaires
echo "Installation des paquets requis..."
sudo apt-get install -y ca-certificates curl gnupg wget

# Vérifie l'installation des paquets nécessaires
echo "Vérification de l'installation des paquets requis..."
dpkg -l | grep -E 'ca-certificates|curl|gnupg|wget' || { echo "Erreur : Un ou plusieurs paquets requis ne sont pas installés correctement."; exit 1; }

# Crée le répertoire pour les clés
echo "Création du répertoire pour les clés..."
sudo install -m 0755 -d /etc/apt/keyrings

# Télécharge et ajoute la clé GPG pour Docker
echo "Téléchargement et ajout de la clé GPG pour Docker..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Vérifie l'ajout de la clé GPG
if [ -f /etc/apt/keyrings/docker.gpg ]; then
    echo "Clé GPG pour Docker ajoutée avec succès."
else
    echo "Erreur : La clé GPG pour Docker n'a pas été ajoutée."
    exit 1
fi

# Fonction pour récupérer le nom de l'OS
get_os_info() {
    . /etc/os-release
    echo "$ID"
}

# Fonction pour récupérer la version codename de l'OS
get_version_codename() {
    . /etc/os-release
    echo "$VERSION_CODENAME"
}

# Fonction pour récupérer l'architecture du système
get_architecture() {
    uname -m
}

# Fonction pour mettre à jour le dépôt Docker
update_docker_repository() {
    local os_name=$1
    local codename=$2
    local architecture=$3

    echo "OS Name: $os_name"
    echo "Version Codename: $codename"
    echo "Architecture: $architecture"

    # Définir le fichier de sources pour Docker
    local docker_source_file="/etc/apt/sources.list.d/docker.list"

    # Créer un fichier de sources pour Docker avec les informations correctes
    echo "Création ou mise à jour du fichier de sources pour Docker..."
    sudo bash -c "cat > $docker_source_file <<EOL
deb [arch=${architecture} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/${os_name} ${codename} stable
EOL"

    # Mettre à jour les listes de paquets
    echo "Mise à jour des listes de paquets..."
    sudo apt-get update
}

# Exécution des fonctions
os_name=$(get_os_info)
codename=$(get_version_codename)
architecture=$(get_architecture)

update_docker_repository "$os_name" "$codename" "$architecture"

# Installation de Docker et autres outils
echo "Installation de Docker et autres outils..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Vérifie l'installation de Docker et ses composants
echo "Vérification de l'installation de Docker..."
dpkg -l | grep -E 'docker-ce|docker-ce-cli|containerd.io' || { echo "Erreur : Docker ou ses composants ne sont pas installés correctement."; exit 1; }

# Demander le nom d'utilisateur et le token Docker
read -p "Votre nom d'utilisateur de Docker : " utilisateur
read -s -p "Entrez votre token Docker ici : " token
echo  # Pour ajouter une nouvelle ligne après l'entrée du token

# Utiliser le token pour se connecter à GitHub Container Registry
echo "$token" | docker login ghcr.io -u "$utilisateur" --password-stdin

# Installation de ContainerLab
echo "Installation de ContainerLab..."
curl -sL https://get.containerlab.dev | sudo bash

# Vérifie l'installation de ContainerLab
echo "Vérification de l'installation de ContainerLab..."
command -v containerlab || { echo "Erreur : ContainerLab n'a pas été installé correctement."; exit 1; }

# Déploiement de la topologie
echo "Déploiement de la topologie..."
sudo containerlab deploy -t topology-vf.yml

# Installation de tcpdump
echo "Installation de tcpdump..."
sudo apt-get install -y tcpdump

# Vérifie l'installation de tcpdump
echo "Vérification de l'installation de tcpdump..."
dpkg -l | grep -q tcpdump || { echo "Erreur : tcpdump n'a pas été installé correctement."; exit 1; }

# Exécution de Docker Compose avec une configuration
echo "Déploiement avec Docker Compose..."
curl -sL https://github.com/siemens/edgeshark/raw/main/deployments/wget/docker-compose-localhost.yaml | DOCKER_DEFAULT_PLATFORM= docker compose -f - up

# Installation de wireshark
echo "Installation de wireshark..."
sudo apt-get install -y wireshark

# Vérifie l'installation de wireshark
echo "Vérification de l'installation de wireshark..."
dpkg -l | grep -q wireshark || { echo "Erreur : wireshark n'a pas été installé correctement."; exit 1; }

# Ajout de l'utilisateur au groupe wireshark
echo "Ajout de l'utilisateur au groupe wireshark..."
sudo gpasswd -a $USER wireshark

# Téléchargement et installation de cshargextcap
echo "Téléchargement et installation de cshargextcap..."
wget https://github.com/siemens/cshargextcap/releases/download/v0.10.7/cshargextcap_0.10.7_linux_amd64.deb
sudo dpkg -i cshargextcap_0.10.7_linux_amd64.deb

# Vérifie l'installation de cshargextcap
echo "Vérification de l'installation de cshargextcap..."
dpkg -l | grep -q cshargextcap || { echo "Erreur : cshargextcap n'a pas été installé correctement."; exit 1; }

# Installation de nmap
echo "Installation de nmap..."
sudo apt-get install -y nmap

# Vérifie l'installation de nmap
echo "Vérification de l'installation de nmap..."
dpkg -l | grep -q nmap || { echo "Erreur : nmap n'a pas été installé correctement."; exit 1; }

# Reboot de la machine
echo "Redémarrage de la machine..."
sudo reboot
