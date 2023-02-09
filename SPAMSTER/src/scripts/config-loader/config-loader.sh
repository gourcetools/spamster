clear
echo " "
echo " "
echo "          \│/  ┌─┐┌─┐┌┐┌┌─┐┬┌─┐  ┬  ┌─┐┌─┐┌┬┐┌─┐┬─┐  ┬  \│/   ";
echo "       ──── ─  │  │ ││││├┤ ││ ┬  │  │ │├─┤ ││├┤ ├┬┘  │  ─ ────";
echo "          /│\  └─┘└─┘┘└┘└  ┴└─┘  ┴─┘└─┘┴ ┴─┴┘└─┘┴└─  o  /│\   ";
echo " "
echo " "
 
echo " == ⚙️ Available configs:"
ls ../../../../spamster-configs
echo " == Enter config name to load:"
read CONFIGNAME
if [ -d "../../../../spamster-configs/$CONFIGNAME" ]; then
  echo " == 📜  LOADING $CONFIGNAME"
  cp -d -r ../../../../spamster-configs/$CONFIGNAME/* ../../../../
    echo " == ✅  LOADED $CONFIGNAME"
echo " "
echo " "
echo " "
echo "          \│/  ┌┬┐┌─┐┌┐┌┌─┐  ┬  \│/   "
echo "       ──── ─   │││ ││││├┤   │  ─ ────"
echo "          /│\  ─┴┘└─┘┘└┘└─┘  o  /│\   "
echo "       	Loaded $CONFIGNAME"
echo "       	succesfully."
echo " "
echo " "
sleep 1
  cd ../menu/
  ./START.sh
else
  echo "Error: Config $CONFIGNAME does not exist"
  ./config-loader.sh
fi



