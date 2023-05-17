#!/bin/bash

# Function to delete directory content safely
safe_delete () {
    echo " =  🗑️  Deleting content in $1"
    find "$1" -type f -exec rm -f {} +
}

# User confirmation for deletion
while true; do
  read -rp "
    == Are you sure you want to delete:
    == ALL: accounts,relays,nostr.json files? 
    == Answer: [y/n] " choice

  case $choice in
    [yY]* )
      echo " == Oki doki..."
      sleep 1
      break;;
    [nN]* )
      echo " == I knew it :P "
      sleep 1
      source ../menu/START.sh
      break;;
    * )
      echo " == Invalid option. Please enter y or n.";;
  esac
done

echo -e "\n\n ============================="
echo " == SPAMSTER RESET STARTED == "
echo " ============================="

# Start deleting files
safe_delete ../../tmp
safe_delete ../../keys/pubkeys
safe_delete ../../keys/privkeys
safe_delete ../../json
# Deleting specific files
echo " =  🗑️ Deleting specific files"
rm -f ../../../config/contact-list.csv
rm -f ../../../config/privkeys-list.txt
rm -f ../../../config/relays-list.txt

# Deleting multi-spamster directory
echo " =  🗑️ Deleting multi-spamster directory"
rm -rf ../../../../multi-spamster

echo " ============================="
echo " == 🚮 SPAMSTER RESET DONE 🚮 == "
echo " ============================="

sleep 1
