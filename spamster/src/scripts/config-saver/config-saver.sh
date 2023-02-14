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

if [[ ! "$CONFIGNAME" =~ ^[a-zA-Z0-9_]+$ ]]; then
  echo "Error: Config name should only contain letters, numbers, and underscores"
  exit 1
fi

if [ -d "../../../../spamster-configs/$CONFIGNAME" ]; then
  echo "Error: Configuration '$CONFIGNAME' already exists"
  exit 1
fi

mkdir -p "../../../../spamster-configs/$CONFIGNAME"
cp -r ../../../../spamster/* ../../../../spamster-configs/$CONFIGNAME/

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
