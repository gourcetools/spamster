echo " "
echo " "
echo "     \│/  ┌┬┐┌─┐┬ ┬┌┐┌┬  ┌─┐┌─┐┌┬┐  ┬─┐┌─┐┬  ┌─┐┬ ┬  ┬  ┬┌─┐┌┬┐  \│/   ";
echo "  ──── ─   │││ ││││││││  │ │├─┤ ││  ├┬┘├┤ │  ├─┤└┬┘  │  │└─┐ │   ─ ────";
echo "     /│\  ─┴┘└─┘└┴┘┘└┘┴─┘└─┘┴ ┴─┴┘  ┴└─└─┘┴─┘┴ ┴ ┴   ┴─┘┴└─┘ ┴   /│\   ";
echo " "
echo " "
sleep 1
# Download a list of nostr relays from nostr.watch
echo " == 🌐 Downloading online relays list from https://api.nostr.watch/v1/online "
curl -s https://api.nostr.watch/v1/online | jq -r '.[]' > relays-list.txt
echo " "
# Check if file is here	
if [ -s relays-list.txt ]
then
echo " == ✅ Download: Succes.  "

else
echo " == ❌ Download failed, restarting.  "
echo " == ❌ Download failed, restarting..  "
echo " == ❌ Download failed, restarting...  "
# Restart script
./dl-relays.sh
fi

#Clean GARBAGE
sed -i '/npub/d' relays-list.txt
sed -i '/=true/d' relays-list.txt
RELAYSCOUNT=$(wc -l < ./relays-list.txt | awk '{print $1}')


# Move list to config folder
mv ./relays-list.txt ../../../config

# Print total time and number of lines
echo " "
echo " "
echo "          \│/  ┌┬┐┌─┐┌┐┌┌─┐  ┬  \│/   "
echo "       ──── ─   │││ ││││├┤   │  ─ ────"
echo "          /│\  ─┴┘└─┘┘└┘└─┘  o  /│\   "
echo " "
echo " ==  RELAYS IN LIST: $RELAYSCOUNT"
echo " ==  📁 Relays saved in spamster/config/relays-list.txt"
echo " "
echo " "
sleep 3

