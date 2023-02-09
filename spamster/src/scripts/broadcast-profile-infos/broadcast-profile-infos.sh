echo "  ===============================================  "
echo "  This script will broadcast profiles informations"
echo "  for ALL accounts that you generated."
echo "  It may take some times as it will try-again until  "
echo "  ALL accounts infos are succesfully send. "
echo "  ===============================================  "
echo "  -Please be patient if it seems stuck, it's not- "
echo "  ===============================================  "

cd ../../keys/pubkeys

echo "  == Enter the domain you used for NIP-05 file:"
echo "  == Leave blank to broadcast without NIP-05 info "
echo "  == Example: gourcetools.github.io"
read nipdomain
echo $nipdomain > DOMAIN

# Start timer
start_time=$(date +%s)



num_cores=$(nproc)
ls *.txt | xargs -P $num_cores -I {} bash -c '
  file={}
  name=${file%.txt}
  pubkey=$(cat ../pubkeys/$file)
  privkey=$(cat ../privkeys/$file)
  about="hey-testing-about"
  DOMAIN=$(cat DOMAIN)
  #relay="wss://relay.nostr.band"
  relay=$(shuf -n 1 ../../../config/relays-list.txt)
  echo " broadcast $name $DOMAIN"
  	while true
  		do
  		echo "  == 🚀 Broadcasting profile informations for: "$name"@"$DOMAIN" to: $relay  | $nipname "
  		result=$(timeout 5s nostril --kind 0 --envelope --sec "$privkey" --content "{\"name\":\"$name\",\"picture\":\"https://nostr.build/i/5616.jpeg\",\"about\":\"$about.\",\"nip05\":\"$name@$DOMAIN\"}" | websocat "$relay")
  		if echo "$result" | grep -q "true"; then
     		echo "  == $result "
     		echo "  == 😃 DONE for: $name "
     		echo " "
     		break
    fi
    echo "  == 😞 Failed for: "$name". We will try again...  "
    relay=$(shuf -n 1 ../../../config/relays-list.txt)
    sleep 1
  done
'

 # End timer
end_time=$(date +%s)
# Calculate total time
total_time=$((end_time - start_time))
totalacc=$(ls ../../keys/pubkeys | wc -l) 
echo " "
 echo "  ===============================================  "
echo " ✔️  BROADCASTED ALL PROFILES INFORMATIONS SUCCESULLY ✔️ "
echo " 🔃 WE UPDATED $totalacc PROFILES IN "$total_time" SECONDS. 🔁"
 echo "  ===============================================  "
 
 cd ../../scripts/broadcast-profile-infos
 rm -f DOMAIN
