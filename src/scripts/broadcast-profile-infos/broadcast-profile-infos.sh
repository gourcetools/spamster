echo "  ===============================================  "
echo "  This script will broadcast profiles informations"
echo "  for ALL accounts that you generated."
echo "  It may take some times as it will try-again until  "
echo "  ALL accounts infos are succesfully send. "
echo "  ===============================================  "
echo "  -Please be patient if it seems stuck, it's not- "
echo "  ===============================================  "

echo "  == Enter the domain you used for NIP-05 file:"
echo "  == Leave blank to broadcast without NIP-05 info "
echo "  == Example: gourcetools.github.io"
read domain

# Start timer
start_time=$(date +%s)

cd ../../keys/pubkeys

num_cores=$(nproc)
ls *.txt | xargs -P $num_cores -I {} bash -c '
  file={}
  name=${file%.txt}
  if [ -z "$domain" ]; then
    FULLNIP=" "
  else
    FULLNIP="$name@$domain"
  fi
  privkey=$(cat ../privkeys/$file)
  pubkey=$(cat ../pubkeys/$file)
  relay=wss://relay.nostr.band
  while true; do
    echo "  == 🚀 Broadcasting profile informations for: $name to: $relay "
    result=$(timeout 5s nostril --kind 0 --envelope --sec "$privkey" --content "{\"name\":\"$name\",\" picture\":\"https://nostr.build/i/5616.jpeg\",\"nip05\":\"$FULLNIP\"}" | websocat "$relay")
    if echo "$result" | grep -q "true"; then
      break
    fi
    echo "  == 😞 Failed for: "$name". We will try again...  "
    relay=$(shuf -n 1 ../../../config/relays-list.txt)
  done
  echo "  == 😃 DONE for: $name "
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
