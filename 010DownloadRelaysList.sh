#!/bin/bash
echo " ============================================     "
echo "          Downloading relay list                  "
echo " ============================================     "
echo "                                                  "
echo "                                                  "
wget --progress=bar:force https://nostr.watch/relays.json -O ./tmp/RelaysList.json
jq -r '.relays[]' ./tmp/RelaysList.json > ./config/RelaysList.txt
rm -f ./tmp/RelaysList.json
source "011EmptyCheck.sh"