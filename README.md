# Network-clab

## Description
Ce projet se concentre sur l'évaluation et la construction d'une topologie réseau sophistiquée à l'aide de **containerLab**. L'objectif est de concevoir un environnement réseau intégrant des technologies et des fonctionnalités avancées permettant une gestion efficace et une visualisation intuitive de l'infrastructure réseau. Le projet met l'accent sur l'utilisation de containerLab pour orchestrer un réseau de conteneurs simulant des appareils réels dans un environnement de laboratoire, incluant la configuration de routeurs virtuels, de commutateurs, et d'autres dispositifs de réseau nécessaires pour tester et analyser la performance et la résilience du système.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les éléments suivants :

- [Docker](https://www.docker.com/get-started)
- [ContainerLab](https://containerlab.dev/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (Optionnel) 

## Installation

   ```bash
   su root
   apt-get install -y git
   git clone https://github.com/clab-ProjetAnnuel2024/Network-clab.git && cd Network-clab
   chmod +x setup.sh
   ./setup.sh
## Utilisation
   containerlab deploy -t <fichier.yml> (--reconfigure)
