if [ $? -eq 124 ]; then
  timedout=$((timedout + 1))
  echo " ⏰ TIMED OUT."

elif echo "$output" | grep -q "true"; then
  success=$((success + 1))
  echo " == Reply from $relay:	$output" 
  echo " ✅ Success."
  
  
elif echo "$output" | grep -q "created"; then
  success=$((success + 1))
  echo " == Reply from $relay:	$output" 
  echo " ✅ Success."
  
  
elif echo "$output" | grep -q "false"; then
  failed=$((failed + 1))
  echo " == Reply from $relay:	$output" 
  echo " ❌ Failed, FALSE."

else
  noreply=$((noreply + 1))
  echo " == Reply from $relay:	$output" 
  echo " ❌ NO REPLY/ERROR from $relay. Likelly failed."

  
fi

