if [ $? -eq 124 ]; then
  timedout=$((timedout + 1))
  echo " ⏰ TIMED OUT."
  echo " Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt


elif echo "$output" | grep -q "true"; then
  success=$((success + 1))
  echo $relay >> ok-relays.txt
  echo "$relay replied:"
  echo " $output "
  echo " "
  echo " ✅ Success."
  
  
elif echo "$output" | grep -q "created"; then
  success=$((success + 1))
  echo $relay >> ok-relays.txt
  echo "$relay replied:"
  echo " $output "
    echo " "
  echo " ✅ Success."
  
  
elif echo "$output" | grep -q "false"; then
  failed=$((failed + 1))
  echo "$relay replied: "$output""
  echo " "
  echo " ❌ Failed, FALSE."
  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt

else
  noreply=$((noreply + 1))
  echo " Reply from $relay:"
  echo "  "$output" "
  echo " 😟 No reply / error from $relay. likelly failed."
  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt
  
fi


if [ -f ok-relays.txt ]; then
  sort ok-relays.txt | uniq > temp.txt && mv temp.txt ok-relays.txt
  echo "======================================================================================="
  echo " 	✅ RELAYS THAT ACCEPTED EVENTS DURING THIS SESSION: ✅"
  cat ok-relays.txt
  cat ok-relays.txt >> ../../../config/relays-list.txt
  sort ../../../config/relays-list.txt | uniq > temp.txt && mv temp.txt ../../../config/relays-list.txt
else
  echo " "
fi

done
