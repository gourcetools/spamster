tor=torify
IP=$(torify wget -qO- http://ipecho.net/plain)
echo "== IP: $IP == "
echo "== Restarting tor..."
echo "== sudo service tor restart"
sudo service tor restart
sleep 2
IP=$(torify wget -qO- http://ipecho.net/plain)
echo "== New IP: $IP == "
echo " "
