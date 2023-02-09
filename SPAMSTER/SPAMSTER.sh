#!/bin/bash


# Check if "clust" is installed
echo " == 🤔 Checking if clust is installed "
if command -v clust > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ clust is not installed please install it"
  echo " == https://github.com/vinliao/clust "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "nostril" is installed
echo " == 🤔 Checking if nostril is installed "
if command -v nostril > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ nostril is not installed please install it."
  echo " == https://github.com/jb55/nostril "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "websocat" is installed
echo " == 🤔 Checking if websocat is installed "
if command -v websocat > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ websocat is not installed please install it"
  echo " == https://github.com/vi/websocat "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi



# Check if "nostr-tool" is installed
echo " == 🤔 Checking if websocat is installed "
if command -v nostr-tool > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ nostr-tool is not installed please install it"
  echo " == https://github.com/0xtrr/nostr-tool "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi




echo "Loading ."
chmod -R +x ./src/scripts/*/*.sh
echo "Loading .."
cd ./src/scripts/menu
echo "Loading ..."
./START.sh



