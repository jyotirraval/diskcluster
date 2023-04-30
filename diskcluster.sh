#!/bin/bash

#Mount the storage disk 1 & 2
echo "Mounting disk 1"
sudo mount /dev/sda1 /home/jyotir/Desktop/DataStorage/Datadisk
echo " "
echo "Mounting disk 2 for replication"
sudo mount /dev/sdb1 /home/jyotir/Desktop/DataStorage/Replicadisk
echo " "

#Replication from disk 1 to disk2
echo "Starting disk replication..."
echo " "

set -o errexit
set -o nounset

readonly SOURCE_DIR="/home/jyotir/Desktop/DataStorage/Datadisk"
readonly BACKUP_DIR="/home/jyotir/Desktop/DataStorage/Replicadisk"

rsync --info=progress2 -av --delete "${SOURCE_DIR}/" "${BACKUP_DIR}"
echo " "
echo "Replication completed"
echo " "
echo "Validating..."


src_size=$(sudo df -m /home/jyotir/Desktop/DataStorage/Datadisk/ | awk 'NR>1 {print $4}')
echo "Source data size is ${src_size}"

dest_size=$(sudo df -m /home/jyotir/Desktop/DataStorage/Replicadisk/ | awk 'NR>1 {print $4}')
echo "Replica data size is ${dest_size}"
echo " "
echo "Task completed"
