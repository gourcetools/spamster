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
echo "--------- Version: 0.0.4 | MIT Liscence ---------";
echo "------------------------------------------------";
echo "------------ FOR RESEARCH USE ONLY -------------";
echo "     ┌─────────────┐";
echo "     │  MAIN MENU  │";
echo "   ┌─┴─────────────┴──────────────────────────┐";
echo "   │    1) Generate keys for each name        │";
echo "   │    2) Generate POW-keys for each name    │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    3) Make nostr.json & broadcast infos  │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    4) Spam public feed                   │";
echo "   │    5) Spam public feed (multi)           │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    6) Follow everybody (broken for now)  │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    7) Reset Spamster                     │";
echo "   │    8) Exit                               │";
echo "   └──────────────────────────────────────────┘";
echo -n "    └─> Enter your choice [1-8]:";



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
  1)  echo "== Generate keys for each name ==" 
    cd ../keygen
   ./keygen.sh
  source ../menu/START.sh ;;
  # Pattern 2
  2)  echo "== Generate POW-keys for each name ==" 
    cd ../keygen-pow
   ./keygen-pow.sh
  source ../menu/START.sh ;;
  # Pattern 3
  3)  echo "== Make nostr.json =="
  cd ../make-json-nip05
   ./makejson.sh
  source ../menu/START.sh ;;
  # Pattern 4
  4)  echo "== Send messages =="
  cd ../sendtext
  ./send-loop.sh 
  source ../menu/START.sh ;;
    # Pattern 5
  5)  echo "== Start multi-sending =="
  cd ../multi-spamster
  ./multi-spamster.sh 
  source ../menu/START.sh ;;
    # Pattern 6
  6)  echo "== Follow everybot =="
  cd ../follow
   ./follow.sh 
  source ../menu/START.sh ;;
  # Pattern 7
  7)  echo "== Reset Spamster =="
  cd ../reset
   ./reset.sh 
  source ../menu/START.sh ;;
  # Pattern 8
  8)  echo "Exit"
      exit;;

  # Default Pattern
  *) echo "     Invalid number..."
    echo "     └─> Enter your choice [1-8]:";;
esac
  echo
done
