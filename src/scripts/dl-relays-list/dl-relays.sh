echo " "
echo " "
echo "      ┌┐┌┌─┐┌─┐┌┬┐┬─┐                 ";
echo "      ││││ │└─┐ │ ├┬┘                 ";
echo "      ┘└┘└─┘└─┘ ┴ ┴└─                 ";
echo "      ┌┐ ┌─┐┌─┐┌┬┐  ┬─┐┌─┐┬  ┌─┐┬ ┬┌─┐";
echo "      ├┴┐├┤ └─┐ │   ├┬┘├┤ │  ├─┤└┬┘└─┐";
echo "      └─┘└─┘└─┘ ┴   ┴└─└─┘┴─┘┴ ┴ ┴ └─┘";
echo " "
echo "   📡 https://github.com/gourcetools/nostr-bestrelays "
echo " "
# Download a list of nostr relays from nostr.watch
echo " == 🌐 Downloading online relays list from https://api.nostr.watch/v1/online "
curl -s https://api.nostr.watch/v1/online | jq -r '.[]' > relays-list.txt
echo " "
# Check if file is here	
if [ -s relays-list.txt ]
then
echo "  == ✅ Succes.  "
cat ./relays-list.txt
else
echo " == ❌ Download failed, restarting.  "
echo " == ❌ Download failed, restarting..  "
echo " == ❌ Download failed, restarting...  "
# Restart script
./dl-relays.sh
fi

# Move list to config folder
mv ./relays-list.txt ../../../config

echo "================================================== "
echo " == ✅ Succes.  "
echo "================================================== "
