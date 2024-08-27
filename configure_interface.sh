#!/bin/bash

# P1 Configuration
docker exec -it clab-LAB_Topology-P1 sh -c "
ip addr add 100.100.1.1/31 dev eth1
ip addr add 100.100.3.0/31 dev eth3
ip addr add 100.100.4.0/31 dev eth4
ip addr add 100.100.12.1/31 dev eth5
ip addr show > /home/P1interfaces.txt
"

# P2 Configuration
docker exec -it clab-LAB_Topology-P2 sh -c "
ip addr add 100.100.3.1/31 dev eth3
ip addr add 100.100.10.0/31 dev eth4
ip addr add 100.100.8.0/31 dev eth5
ip addr add 100.100.13.1/31 dev eth6
ip addr show > /home/P2interfaces.txt
"

# P3 Configuration
docker exec -it clab-LAB_Topology-P3 sh -c "
ip addr add 100.100.5.0/31 dev eth1
ip addr add 100.100.6.0/31 dev eth3
ip addr add 100.100.4.1/31 dev eth4
ip addr show > /home/P3interfaces.txt
"

# P4 Configuration
docker exec -it clab-LAB_Topology-P4 sh -c "
ip addr add 100.100.5.1/31 dev eth1
ip addr add 100.100.9.1/31 dev eth2
ip addr add 100.100.8.1/31 dev eth5
ip addr show > /home/P4interfaces.txt
"

# P5 Configuration
docker exec -it clab-LAB_Topology-P5 sh -c "
ip addr add 100.100.7.0/31 dev eth1
ip addr add 100.100.2.1/31 dev eth2
ip addr add 100.100.6.1/31 dev eth3
ip addr show > /home/P5interfaces.txt
"

# P6 Configuration
docker exec -it clab-LAB_Topology-P6 sh -c "
ip addr add 100.100.7.1/31 dev eth1
ip addr add 100.100.9.0/31 dev eth2
ip addr add 100.100.11.0/31 dev eth3
ip addr show > /home/P6interfaces.txt
"

# PE1 Configuration
docker exec -it clab-LAB_Topology-PE1 sh -c "
ip addr add 100.100.1.0/31 dev eth1
ip addr add 100.100.2.0/31 dev eth2
ip addr show > /home/PE1interfaces.txt
"

# PE2 Configuration
docker exec -it clab-LAB_Topology-PE2 sh -c "
ip addr add 100.100.11.1/31 dev eth3
ip addr add 100.100.10.1/31 dev eth4
ip addr show > /home/PE2interfaces.txt
"

# PE3 Configuration
docker exec -it clab-LAB_Topology-PE3 sh -c "
ip addr add 100.100.12.0/31 dev e1-5
ip addr add 100.100.13.0/31 dev e1-6
ip addr show > /home/PE3interfaces.txt
"

echo "Configuration des interfaces terminée."
