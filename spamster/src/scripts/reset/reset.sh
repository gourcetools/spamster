
while true; do
  read -p "
    == Are you sure you want to delete:
    == ALL: accounts,relays,nostr.json files? 
    == Answer: [y/n] " choice
  if [[ $choice == "y" || $choice == "Y" ]]; then
    echo " == Oki doki..."
    sleep 1
    # continue with the rest of the script
    break
  elif [[ $choice == "n" || $choice == "N" ]]; then
    echo " == I knew it :P "
    sleep 1
    source ../menu/START.sh
    break
  else
    echo " == Invalid option. Please enter y or n."
  fi
done

echo " "
echo " "
echo " ============================="
echo " == SPAMSTER RESET STARTED == "
echo " ============================="
cd ../../
echo " = Purging tmp folder"
cd tmp
rm -f *
cd ..
echo " =  🗑️ Deleting stuff in pubkeys folder"
cd keys/pubkeys
rm -f *
cd ..
echo " =  🗑️ Deleting stuff in privkeys folder"
cd privkeys
rm -f *
echo " =  🗑️ Deleting nostr.json"
cd ../../json
rm -f *
cd ../../config
echo " =  🗑️ Deleting contact-list.csv"
rm -f contact-list.csv
echo " =  🗑️ Deleting privkeys-list.txt"
rm -f privkeys-list.txt
echo " =  🗑️ Deleting relays-list.txt"
rm -f relays-list.txt

cd ../src/scripts/reset

echo " =  🗑️ Deleting multi-spamster"
rm -f -d -r ../../../../multi-spamster

echo " ============================="
echo " == 🚮 SPAMSTER RESET DONE 🚮 == "
echo " ============================="
    sleep 1
