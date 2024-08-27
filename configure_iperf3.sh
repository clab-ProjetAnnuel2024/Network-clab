#!/bin/bash

# Installation d'iperf3 sur tous les équipements sauf PE3

# P1
docker exec -it clab-LAB_Topology-P1 sh -c "
apk update && apk add iperf3
"

# P2
docker exec -it clab-LAB_Topology-P2 sh -c "
apk update && apk add iperf3
"

# P3
docker exec -it clab-LAB_Topology-P3 sh -c "
apk update && apk add iperf3
"

# P4
docker exec -it clab-LAB_Topology-P4 sh -c "
apk update && apk add iperf3
"

# P5
docker exec -it clab-LAB_Topology-P5 sh -c "
apk update && apk add iperf3
"

# P6
docker exec -it clab-LAB_Topology-P6 sh -c "
apk update && apk add iperf3
"

# PE1
docker exec -it clab-LAB_Topology-PE1 sh -c "
apk update && apk add iperf3
"

# PE2
docker exec -it clab-LAB_Topology-PE2 sh -c "
apk update && apk add iperf3
"

echo "Installation d'iperf3 terminée sur tous les équipements sauf PE3."
