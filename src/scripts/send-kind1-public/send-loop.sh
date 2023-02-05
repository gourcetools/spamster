number=$(cat NUMBER)
port=$(cat SOCKSPORT)
control_port=$(cat CONTROLPORT)
echo "== TOR: "
echo "== Port: $port"
echo "== Control port:$control_port"

echo "== Launching tor"
x-terminal-emulator -e tor -f "etc/torsocks.conf$number" -SocksPort $port &

# Let tor start properly.
sleep 30
echo " "


IP=$(curl --socks5-hostname 127.0.0.1:$port -s https://check.torproject.org | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1)
echo $IP


success=0
failed=0
timedout=0

while true
do
privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
message=$(shuf -n 1 ../../../config/messages-list.txt)
relay=$(shuf -n 1 ../../../config/relays-list.txt)



sleep 1
clear

echo "		┌───────────────────────────────┐"
echo "		│ *SPAMSTER $number IS RUNNING*	:)	 "
echo "		│ * IP: "$IP"     		 "
echo "		├───────────────────────────────┤"
echo "		│ Total succes: "$success"		 "
echo "		│ Total failed : "$failed"	 "
echo "		│ Total timed out : "$timedout"	 "
echo "		└───────────────────────────────┘"
echo " "
echo "Relay: $relay"
echo "Message: $message"

output=$(timeout 5s bash -c "nostril --envelope --sec \"$privkey\" --content \"$IP\" | websocat --socks5 127.0.0.1:$port $relay")
echo $output 
  if [ $? -eq 124 ]
  then
    timedout=$(($timedout+1))
    echo "❌ Timed out."
  elif echo "$output" | grep -q "OK"; then
    success=$(($success+1))
    echo "✅ Success."

  else
  failed=$(($failed+1))
    echo "❌ FAILED.: $output"
  fi		
done






