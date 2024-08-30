# Network-clab

## Description
Ce projet se concentre sur l'évaluation et la construction d'une topologie réseau sophistiquée à l'aide de **containerLab**. L'objectif est de concevoir un environnement réseau intégrant des technologies et des fonctionnalités avancées permettant une gestion efficace et une visualisation intuitive de l'infrastructure réseau. Le projet met l'accent sur l'utilisation de containerLab pour orchestrer un réseau de conteneurs simulant des appareils réels dans un environnement de laboratoire, incluant la configuration de routeurs virtuels, de commutateurs, et d'autres dispositifs de réseau nécessaires pour tester et analyser la performance et la résilience du système.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les éléments suivants :

- Un hyperviseur (VmWare de préférence)
- Une image ISO de l’architecture Linux
- VM avec au minimum 8 Go de Ram, 2 CPU Quad-Core et 60 Go pour le stockage
- [Token Github](https://github.com/settings/tokens)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)


## Installation

   ```bash
   su root
   apt-get update && apt-get install -y git
   git clone https://github.com/clab-ProjetAnnuel2024/Network-clab.git && cd Network-clab
   chmod +x setup_clab.sh && bash ./setup_clab.sh
## Après le redémmarage à la fin du script script
   cd Network-clab && containerlab deploy -t topology-vf.yml
