NUMBER=$(cat NUMBER)
PORT=$(cat PORT)

echo "======================================================================================="
echo " == š¤  I'M SPAMSTER nĀ°$NUMBER š¤ "
echo " == š§ I will use TOR on port: $PORT "
echo "======================================================================================="
sleep $NUMBER

# Start tor on specified port.

echo "== Starting tor on port:$PORT..."
tor -f "etc/torrc" >/dev/null 2>&1 &

# Let tor start properly.
echo "== Waiting for tor to start..."
echo "======================================================================================="
while true; do
  IP=$(curl --socks5-hostname 127.0.0.1:$PORT -s https://check.torproject.org | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1)

  if [ -z "$IP" ]; then
echo "======================================================================================="
    echo "== ā NO TOR IP FOUND ON $PORT, LET'S WAIT..."
echo "======================================================================================="
  else
echo "======================================================================================="
    echo "== ā READY - TOR IP FOUND ON PORT $PORT: $IP"
echo "======================================================================================="
    break
  fi
done

