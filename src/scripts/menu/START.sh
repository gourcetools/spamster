#!/bin/bash
# START.sh
echo "";
echo "███████████████████████████████████████████████████";
echo "█─▄▄▄▄█▄─▄▄─██▀▄─██▄─▀█▀─▄█─▄▄▄▄█─▄─▄─█▄─▄▄─█▄─▄▄▀█";
echo "█▄▄▄▄─██─▄▄▄██─▀─███─█▄█─██▄▄▄▄─███─████─▄█▀██─▄─▄█";
echo "▀▄▄▄▄▄▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀";
echo "";
echo "------------------------------------------------";
echo "-------------- Welcome to Spamster ------------- ";
echo "--------- Version: 0.0.3 | MIT Liscence ---------";
echo "------------------------------------------------";
echo "------------ FOR RESEARCH USE ONLY -------------";
echo "     ┌─────────────┐";
echo "     │  MAIN MENU  │";
echo "   ┌─┴─────────────┴──────────────────────────┐";
echo "   │    1) Generate keys                      │";
echo "   │    2) Make nostr.json                    │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    3) Start sending                      │";
echo "   │    4) Start multi-sending                │";
echo "   │    5) Follow everybody (broken for now)  │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    6) Reset Spamster   	              │";
echo "   │    7) Exit                               │";
echo "   └──────────────────────────────────────────┘";
echo -n "    └─> Enter your choice [1-7]:";

# Running a forever loop using while statement
# This loop will run untill select the exit option.
# User will be asked to select option again and again
while :
do

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
  # Pattern 1
  1)  echo "== Generate keys ==" 
    cd ../keygen
   ./keygen.sh
   ./name.sh
  source ../menu/START.sh ;;
  2)  echo "== Make nostr.json =="
  cd ../make-json-nip05
   ./makejson.sh
  source ../menu/START.sh ;;
  # Pattern 3
  3)  echo "== Send messages =="
  cd ../sendtext
  ./send-loop.sh 
  source ../menu/START.sh ;;
    # Pattern 4
  4)  echo "== Start multi-sending =="
  cd ../multi-spamster
  ./multi-spamster.sh 
  source ../menu/START.sh ;;
    # Pattern 5
  5)  echo "== Follow everybot =="
  cd ../follow
   ./follow.sh 
  source ../menu/START.sh ;;
  # Pattern 6
  6)  echo "== Reset Spamster =="
  cd ../reset
   ./reset.sh 
  source ../menu/START.sh ;;
  # Pattern 7
  7)  echo "Exit"
      exit;;

  # Default Pattern
  *) echo "     Invalid number..."
    echo "     └─> Enter your choice [1-7]:";;
esac
  echo
done
