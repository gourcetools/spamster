#This script will save actual configuration to ./configs/ folder
clear
echo " "
echo " "
echo "          \│/  ┌─┐┌─┐┌┐┌┌─┐┬┌─┐  ┌─┐┌─┐┬  ┬┌─┐┬─┐  ┬  \│/   ";
echo "       ──── ─  │  │ ││││├┤ ││ ┬  └─┐├─┤└┐┌┘├┤ ├┬┘  │  ─ ────";
echo "          /│\  └─┘└─┘┘└┘└  ┴└─┘  └─┘┴ ┴ └┘ └─┘┴└─  o  /│\   ";
echo " "
echo " "


echo " == ⚙️ Save current config as:"
read CONFIGNAME

rm -f -d -r ../../../../spamster-configs/$CONFIGNAME
mkdir -p  ../../../../spamster-configs/$CONFIGNAME
cp -d -r ../../../../spamster/* ../../../../spamster-configs/$CONFIGNAME/

echo " "
echo " "
echo "          \│/  ┌┬┐┌─┐┌┐┌┌─┐  ┬  \│/   "
echo "       ──── ─   │││ ││││├┤   │  ─ ────"
echo "          /│\  ─┴┘└─┘┘└┘└─┘  o  /│\   "
echo "       	Saved $CONFIGNAME"
echo "       	succesfully."
echo " "
echo " "
sleep 2
