#!/bin/bash

# A script to perform incremental backups using rsync

set -o errexit
set -o nounset

readonly SOURCE_DIR="/home/jyotir/Desktop/DataStorage/Datadisk"
readonly BACKUP_DIR="/home/jyotir/Desktop/DataStorage/Replicadisk"

rsync --progress -av --delete "${SOURCE_DIR}/" "${BACKUP_DIR}"
