cd ../../keys/pubkeys/
rm -f ../../../config/contact-list

for file in *.txt;
	do 
	  relay=$(shuf -n 1 ../../../config/relays-list.txt)
	  pubkey=$(cat $file)
	 
	  # Add each pubkey to contact list with -p tag for kind3 event later
	  echo "-p $pubkey">> ../../../config/contact-list
	done
echo "  ===============================================  "
echo "  Contactlist look like that: "
cat ../../../config/contact-list
echo "  ===============================================  "


 # End timer
end_time=$(date +%s)
# Calculate total time
total_time=$((end_time - start_time))
totalacc=$(ls ../../keys/pubkeys | wc -l) 
echo " "
 echo "  ===============================================  "
echo " ✔️  SAVED CONTACT LIST IN ../../../config/contact-list ✔️ "
 echo "  ===============================================  "
 
 cd ../../scripts/create-contact-list
