
rm -f ../../../config/contact-list.csv


echo "  ===============================================  "
echo " 		MAKING CONTACT LIST..."
echo "  ===============================================  "

##  Start writing contact-list.csv 

echo -ne "pubkey,relay,petname
" > ../../../config/contact-list.csv


cd ../../keys/pubkeys/
for file in *.txt;
	do 
	  relay=$(shuf -n 1 ../../../config/relays-list.txt)
	  pubkey=$(cat $file)
	  name="${file%%.*}"
	  # Add each pubkey to contact list with -p tag for kind3 event later
	  echo "$pubkey,$relay,$name">> ../../../config/contact-list.csv
	  echo " == Writing contact infos for: $name"
	done
echo "  ===============================================  "
echo "  Contactlist look like that: "
cat ../../../config/contact-list.csv
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
sleep 5
 cd ../../scripts/create-contact-list2
