#!/bin/bash

# Prompt for container number
read -p "Enter container number: " ctnumber

# Perform backup
vzdump $ctnumber --mode stop --compress gzip --dumpdir /var/lib/vz/template/cache

# Change to the backup directory
cd /var/lib/vz/template/cache

# Find the most recent backup file for the given container number
backupfile=$(ls -t vzdump-*-$ctnumber-*.tar.gz | head -n1)

# Prompt for new template name
read -p "Enter new template name: " newtemplatename

# Rename the backup file
mv "$backupfile" "$newtemplatename.tar.gz"

echo "Backup created and renamed to $newtemplatename.tar.gz"
