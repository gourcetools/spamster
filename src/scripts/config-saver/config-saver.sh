#This script will save actual configuration to ./configs/ folder
echo "CONFIGURATION-SAVER"
echo "Config name:"
read CONFIGNAME

rm -f -d -r ../../../../spamster-configs/$CONFIGNAME
mkdir -p  ../../../../spamster-configs/$CONFIGNAME
cp -d -r ../../../../spamster/* ../../../../spamster-configs/$CONFIGNAME/

echo "SAVED $CONFIGNAME."
