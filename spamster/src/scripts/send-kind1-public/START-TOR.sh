NUMBER=$(cat NUMBER)
PORT=$(cat PORT)

echo "======================================================================================="
echo " == 🤖  I'M SPAMSTER n°$NUMBER 🤖 "
echo " == 🧅 I will use TOR on port: $PORT "
echo "======================================================================================="
sleep $NUMBER

# Start tor on specified port.

echo "== Starting tor on port:$PORT..."
tor -f "etc/torrc" 

# Let tor start properly.
echo "== Waiting for tor to start..."
echo "======================================================================================="
while true; do
  IP=$(curl --socks5-hostname 127.0.0.1:$PORT -s https://check.torproject.org | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1)

  if [ -z "$IP" ]; then
echo "======================================================================================="
    echo "== ❌ NO TOR IP FOUND ON $PORT, LET'S WAIT..."
echo "======================================================================================="
sleep 5
  else
echo "======================================================================================="
    echo "== ✅ READY - TOR IP FOUND ON PORT $PORT: $IP"
echo "======================================================================================="
    break
  fi
done

