# Start timer
start_time=$(date +%s)
num_cores=$(nproc)


echo "  ===============================================  "
echo "  This script will broadcast follow informations"
echo "  for ALL accounts that you generated."
echo "  It may take some times as it will try-again until  "
echo "  ALL accounts follow are succesfully send. "
echo "  ===============================================  "
echo "  -Please be patient if it seems stuck, it's not- "
echo "  ===============================================  "


cd ../../keys/pubkeys
ls *.txt | xargs -P $num_cores -I {} bash -c '
  file={}
  privkey=$(cat ../privkeys/$file)
  echo $privkey
  relay="wss://relay.nostr.band"
  	while true
  		do
  		  file={}
  		  name=${file%.txt}
  		  contactlist=$(cat ../../../config/contact-list)
  		  echo "  == 🚀 Broadcasting follow list for: $name  to: $relay "
  		  result=$(timeout 1s nostr-tool -r $relay -p $privkey publish-contact-list-csv -f ../../../config/contact-list.csv)
  		  if echo "$result" | grep -q "imported"; then
     		  echo "$result"
     		  echo "  == 😃 DONE for: $name "
     		  break
    fi
    echo "  == 😞 Failed for: "$name". We will try again...  "
    relay=$(shuf -n 1 ../../../config/relays-list.txt)
  done
'

 # End timer
end_time=$(date +%s)
# Calculate total time
total_time=$((end_time - start_time))
totalacc=$(ls ../../keys/pubkeys | wc -l) 
echo " "
 echo "  ===============================================  "
echo " ✔️  BROADCASTED ALL FOLLOW INFORMATIONS SUCCESULLY ✔️ "
echo " 🔃 WE UPDATED $totalacc PROFILES IN "$total_time" SECONDS. 🔁"
 echo "  ===============================================  "
 
cd ../../scripts/broadcast-contact-list
