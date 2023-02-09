echo "CONFIGURATION-LOADE"
echo "Available Configs:"
ls ../../../../spamster-configs
echo "Enter Config name to load:"
read CONFIGNAME
if [ -d "../../../configs/$CONFIGNAME" ]; then
  echo "LOADING $CONFIGNAME"
  cp -d -r ../../../../spamster-configs/$CONFIGNAME/* ../../../../
    echo "LOADED $CONFIGNAME"
  cd ../menu/
  ./START.sh
else
  echo "Error: Config $CONFIGNAME does not exist"
  cd ../menu/
  ./START.sh
fi

