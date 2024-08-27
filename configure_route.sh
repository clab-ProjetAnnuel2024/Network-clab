#!/bin/bash

# P1 Configuration
docker exec -it clab-LAB_Topology-P1 sh -c "
ip route add 100.100.10.0/31 via 100.100.3.1
ip route add 100.100.6.0/31 via 100.100.4.1
ip route show > /home/P1routes.txt
"

# P2 Configuration
docker exec -it clab-LAB_Topology-P2 sh -c "
ip route add 100.100.1.0/31 via 100.100.3.0
ip route add 100.100.9.0/31 via 100.100.8.1
ip route add 100.100.4.0/31 via 100.100.3.0
ip route show > /home/P2routes.txt
"

# P3 Configuration
docker exec -it clab-LAB_Topology-P3 sh -c "
ip route add 100.100.1.0/31 via 100.100.4.0
ip route add 100.100.10.0/31 via 100.100.4.0
ip route add 100.100.11.0/31 via 100.100.6.1
ip route add 100.100.3.0/31 via 100.100.4.0
ip route show > /home/P3routes.txt
"

# P4 Configuration
docker exec -it clab-LAB_Topology-P4 sh -c "
ip route add 100.100.11.0/31 via 100.100.9.0
ip route add 100.100.10.0/31 via 100.100.8.0
ip route add 100.100.13.0/31 via 100.100.8.0
ip route add 100.100.2.0/31 via 100.100.5.0
ip route add 100.100.1.0/31 via 100.100.8.0
ip route add 100.100.6.0/31 via 100.100.5.0
ip route show > /home/P4routes.txt
"
 P5 Configuration
docker exec -it clab-LAB_Topology-P5 sh -c "
ip route add 100.100.11.0/31 via 100.100.7.1
ip route add 100.100.12.0/31 via 100.100.6.0
ip route add 100.100.5.0/31 via 100.100.6.0
ip route add 100.100.4.0/31 via 100.100.6.0
ip route show > /home/P5routes.txt
"

# P6 Configuration
docker exec -it clab-LAB_Topology-P6 sh -c "
ip route add 100.100.2.0/31 via 100.100.7.0
ip route add 100.100.8.0/31 via 100.100.9.1
ip route add 100.100.13.0/31 via 100.100.9.1
ip route show > /home/P6routes.txt
"

# PE1 Configuration
docker exec -it clab-LAB_Topology-PE1 sh -c "
ip route add 100.100.7.0/31 via 100.100.2.1
ip route add 100.100.3.0/31 via 100.100.1.1
ip route add 100.100.12.0/31 via 100.100.1.1
ip route add 100.100.4.0/31 via 100.100.1.1
ip route add 100.100.6.0/31 via 100.100.2.1
ip route add 100.100.11.0/31 via 100.100.2.1
ip route add 100.100.5.0/31 via 100.100.2.1
ip route add 100.100.8.0/31 via 100.100.1.1
ip route show > /home/PE1routes.txt
"
# PE2 Configuration
docker exec -it clab-LAB_Topology-PE2 sh -c "
ip route add 100.100.7.0/31 via 100.100.11.0
ip route add 100.100.9.0/31 via 100.100.11.0
ip route add 100.100.8.0/31 via 100.100.10.0
ip route add 100.100.3.0/31 via 100.100.10.0
ip route add 100.100.13.0/31 via 100.100.10.0
ip route add 100.100.2.0/31 via 100.100.11.0
ip route add 100.100.4.0/31 via 100.100.10.0
ip route add 100.100.6.0/31 via 100.100.11.0
ip route show > /home/PE2routes.txt
"

# PE3 Configuration
docker exec -it clab-LAB_Topology-PE3 sh -c "
ip route add 100.100.1.0/31 via 100.100.12.1
ip route add 100.100.10.0/31 via 100.100.13.1
ip route add 100.100.4.0/31 via 100.100.12.1
ip route add 100.100.8.0/31 via 100.100.13.1
ip route add 100.100.6.0/31 via 100.100.12.1
ip route add 100.100.9.0/31 via 100.100.13.1
ip route show > /home/PE3routes.txt
"

echo "Configuration des routes terminée."
