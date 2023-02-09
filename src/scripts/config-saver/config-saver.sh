#This script will save actual configuration to ./configs/ folder
echo "CONFIGURATION-SAVER"
echo "Config name:"
read CONFIGNAME
mkdir -p  ../../../configs/
rm -f -d -r ../../../configs/$CONFIGNAME


mkdir -p  ../../../configs/$CONFIGNAME
cp -d -r ../../../config/ ../../../configs/$CONFIGNAME
mkdir -p  ../../../configs/$CONFIGNAME/src/keys
cp -r ../../../src/keys ../../../configs/$CONFIGNAME/src/keys
echo "SAVED $CONFIGNAME."
