
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
echo "          Ping and find best nostr relays for you "
echo " "
# Delete a potentially old relays-list.txt
rm -f relays-list.txt
# Download a list of nostr relays from nostr.watch
echo "  == 🌐 Downloading full relays list from nostr.watch "
wget -q https://raw.githubusercontent.com/dskvr/nostr-watch/develop/relays.yaml
echo " "
# Check if file is here	
if [ -s relays.yaml ]
then
echo "  == ✅ Succes.  "
else
echo "  == ❌ Download failed, restarting.  "
echo "  == ❌ Download failed, restarting..  "
echo "  == ❌ Download failed, restarting...  "
./nostr-bestrelays.sh
fi

# Remove the first line wich is " Relays :"
sed -i "1d" relays.yaml

# Remove spaces and wss:// from relays so we can ping urls

cut -c 11- relays.yaml > urllist.txt && rm -f relays.yaml


# Delete any relays that have a / , if it breaks the ping command 
sed -i '/\//d' urllist.txt


# urllist.txt is ready for pinging
echo " "
echo "  ======================================================= "
echo " "
# Ping the urls in urllist.txt and sort them by ping
cat urllist.txt | while read LINE
do
    echo "  == 🏓 Pinging $LINE "
    # Timeout 0.5 second. If it takes more than that, we dont want this relay.
    # Output a list starting with pings in sorted.txt
    timeout 0.5 ping -c 1 "$LINE" | tail -n 1 | awk '{print $4}' | cut -d '/' -f 2 | echo $(cat) + "$LINE" >> pinged.txt
    sed -n '$s/\(.*\)+.*/\1/p' pinged.txt
done
echo " "
echo " "

echo "   ✅ Done pinging all relays.  "
echo " "

# Delete urllist.txt.txt we dont need it anymore.
rm -f urllist.txt

#Delete relays that errored or returned no ping before sorting
while read line; do
  if [[ $line =~ ^[0-9] ]]; then
    echo "$line" >> ok.txt
  fi
done < pinged.txt
mv ok.txt pinged.txt


#Sort relays by ping
sort -n pinged.txt > sorted.txt

# Delete pinged.txt, we dont need it anymore.
rm pinged.txt

# Remove pings data from sorted relay list.
while read line; do
	echo ${line} | sed 's/.*+//'>>URLrelays.txt
done <sorted.txt
# Delete sorted.txt, we dont need it anymore.
rm -f sorted.txt


# Remove first character wich is a dot left from the pinging... it works.
sed -i 's/^.//' URLrelays.txt

# Keep the first 50 lines
head -n 50 URLrelays.txt > relays-list.txt

# Delete URLrelays.txt we dont need it anymore.
rm -f URLrelays.txt

# Add back wss:// to relays list
sed -i 's/^/wss:\/\//' relays-list.txt

# All done :)
echo "================================================== "
echo "All done"
mv ./relays-list.txt ../../../config
echo "================================================== "
