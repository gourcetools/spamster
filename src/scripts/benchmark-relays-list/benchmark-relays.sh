# Download a list of nostr relays from nostr.watch
echo "  == 🌐 Downloading online relays list from nostr.watch "
curl -s https://api.nostr.watch/v1/online | jq -r '.[]' > relays-list.txt
echo " "
# Check if file is here	
if [ -s relays-list.txt ]
then
echo "  == ✅ Succes.  "
else
echo "  == ❌ Download failed, restarting.  "
echo "  == ❌ Download failed, restarting..  "
echo "  == ❌ Download failed, restarting...  "
./benchmark-relays.sh
fi

# Clean shit
echo "Clean shit"
grep -v "npub" relays-list.txt > relays-list.tmp && mv relays-list.tmp relays-list.txt


# Benchmark
echo "Benchmark"


while read line; do
  privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
  message=$(shuf -n 1 ../../../config/messages-list.txt)
  echo " "
  echo " "
  echo "========================================================================="
  echo "Benchmarking: $line"
  echo "Privkey: $privkey"
  echo "Message: $message"
# Filter by output

output=$(timeout 10s bash -c "nostril --envelope --sec \"$privkey\" --content \"$IP\" | websocat --socks5 127.0.0.1:9050 $line")
if [ $? -eq 124 ]; then
  timedout=$((timedout + 1))
  echo " ⏰ TIMED OUT."
elif echo "$output" | grep -q "true"; then
  success=$((success + 1))
  echo $line >> vulnerable-relays.txt
  echo " Reply:"
  echo " $output"
  echo " ✅ Success."
elif echo "$output" | grep -q "created"; then
  success=$((success + 1))
  echo $line >> vulnerable-relays.txt
  echo " Reply:"
  echo " $output"
  echo " ✅ Success."
elif echo "$output" | grep -q "false"; then
  failed=$((failed + 1))
  echo " Reply:"
  echo " $output"
  echo " ❌ Failed, FALSE."
else
  noreply=$((noreply + 1))
  echo " Reply:"
  echo " $output"
  echo " 😟 No reply/websocat error from $line. likelly failed."
fi

done < relays-list.txt




# Get relays infos using nip11

while read line; do
	url="${line:6}"
	echo "================================="
	echo "INFO FOR: $url "
	
	
	
	output=$(curl --max-time 5 -s -H "Accept: application/nostr+json" https://"$url") 
	name=$(echo "$output" | jq -r '.name')
	soft=$(echo "$output" | jq -r '.software')
	version=$(echo "$output" | jq -r '.version')
	contact=$(echo "$output" | jq -r '.contact')
	
	echo "NAME: $name"
	echo "CONTACT: $contact"
	echo "SOFTWARE: $soft"
	echo "VERSION: $version"
	echo "================================="
	echo "$soft" >> software.txt
	echo "$contact"   >> contact.txt
	echo " "
done < vulnerable-relays.txt

# Clean contact file
# Keep only lines with @
awk '/@/' contact.txt > cleaned_list.txt 
mv ./cleaned_list.txt ./contact.txt
# Remove Mailto and  unset contact
sed -i 's/^mailto://g' contact.txt 
sed -i 's/^operator@your-domain.com//g' contact.txt 
sed -i 's/^test@test.com//g' contact.txt 


# Remove empty lines
sed -i '/^$/d' contact.txt
echo "============================"
echo "== CONTACT RELAY OWNERS: =="
cat contact.txt
echo "============================"
# Remove empty lines
sed -i '/^$/d' software.txt
# Count
echo " "
echo "============================"
echo "== SOFTWARE USED: =="
sort software.txt | uniq -c | sort -nr
echo "============================"
echo " "




echo "================================================== "
echo " 		All done"
echo "  💾 Saved vulnerables relays in: ./config/relays-list.txt "
cp ./vulnerable-relays.txt ../../../config/relays-list.txt
echo "================================================== "


rm -f *.txt

