if [ $? -eq 124 ]; then
  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt
  
elif echo "$output" | grep -q "false"; then

  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt

elif echo "$output" | grep -q "true"; then

  echo $relay >> ok-relays.txt

  
elif echo "$output" | grep -q "created"; then

  echo $relay >> ok-relays.txt


else
  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt
  
fi


if [ -f ok-relays.txt ]; then
  sort ok-relays.txt | uniq > temp.txt && mv temp.txt ok-relays.txt
  cat ok-relays.txt >> ../../../config/relays-list.txt
  sort ../../../config/relays-list.txt | uniq > temp.txt && mv temp.txt ../../../config/relays-list.txt
else
  echo " "
fi
