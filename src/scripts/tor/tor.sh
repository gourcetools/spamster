sudo service tor restart
sleep 2
. torsocks on
IP=$(wget -qO- http://ipecho.net/plain)
echo "== Using IP: $IP == "
echo " "
sleep 3
