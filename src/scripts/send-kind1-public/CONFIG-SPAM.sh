#!/bin/bash

number=1
port=9050
control_port=9051

fulldir=$(pwd)
basename="${fulldir##*/}"

# Create folder if needed and delete possible old instances
mkdir -p ../../../../multi-spamster
rm -f -r ../../../../multi-spamster/*




# Ask user we he want to use tor
while true; do
    read -p "
 ========================================
 ==  🧅DO YOU WANT TO USE TOR? 🧅
 == We will use unique tor IP for each bot 
 == ANSWER: y/n ? " yn
    case $yn in
        [Yy]* ) echo " == GOTCHA, 🧅 We will use tor.";echo " ========================================";USETOR="yes"; break;;
        [Nn]* ) echo " == GOTCHA, 🌐 We will NOT use tor.";echo " ========================================"; break;;
        * ) echo " == ❌ ERROR : Please answer "y" for yes or "n" for no. ❌ ";;
    esac
done



# Ask for how many bots he want to make
echo " == 🤖 Enter how many bots you want to create:"


read count
while (( i++ < $count )); do
  # Create bots
  cp -r "../../../../spamster" "../../../../multi-spamster/spamster$i"
done





echo " == ✅ Done with bot $count"
# Go to bot folder
cd ../../../../multi-spamster


  for d in ./* ; do
  cd $d/src/scripts/$basename

	# Check if we use tor, if so, write config file 
	if [ "$USETOR" == "yes" ]
	then
	echo " == You asked me to use tor, let me write a config file..."
	# Save variable for later use
	echo "$USETOR" > USETOR
	source ./WRITE-TOR-CONFIG.sh
	# Start bot in a x-term emulator tab
	x-terminal-emulator -e "bash -c './START-SPAM.sh; bash'" &
else
  	# Save instance and port number for later use in another script 
	echo "$number" > NUMBER
	let "number+=1"
  	x-terminal-emulator -e "bash -c './START-SPAM.sh; bash'" &
fi

# Come back 
cd ../../../../

done


