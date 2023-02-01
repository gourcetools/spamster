unset IP
IP=$(wget -qO- http://ipecho.net/plain)
echo "";
echo "███████████████████████████████████████████████████";
echo "█─▄▄▄▄█▄─▄▄─██▀▄─██▄─▀█▀─▄█─▄▄▄▄█─▄─▄─█▄─▄▄─█▄─▄▄▀█";
echo "█▄▄▄▄─██─▄▄▄██─▀─███─█▄█─██▄▄▄▄─███─████─▄█▀██─▄─▄█";
echo "▀▄▄▄▄▄▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀";
echo "	└─>🌐 Using IP: $IP 🌐<─┘";
echo "-----------------------------------------------------";
echo "-------------- 🤖 Welcome to Spamster 🤖 ----------- ";
echo "---------  Version: 0.0.5 | Liscence: MIT  -----------";
echo "------------ 🧪 FOR RESEARCH USE ONLY 🧪 -------------";
echo "                  ┌─────────────────┐";
echo "                  │   📜 MAIN MENU  │";
echo "   ┌──────────────┴─────────────────┴──────────────────┐";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │      0) 📡 Download/update relays list            │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │            🔧 ACCOUNTS MANAGEMENT 🔧              │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    1) 🔑 Generate keys for each name              │";
echo "   │ or 2) ⛏️ Generate POW-keys for each name           │";
echo "   │     then -->  3) 📁 Make a nostr.json for nip05  │";
echo "   │                             + update profiles     │";  
echo "   ├───────────────────────────────────────────────────┤";
echo "   │            🕹️ SPAM MANAGEMENT 🕹️                    │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    4) 📢 🌐 Spam global feed                     │";
echo "   │    5) 📢 📺  Spam public channels                  │";
echo "   │    6) 📢 💬  Spam  DMs                            │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    7) 🧅 Enable tor	/ Switch IP                  │";
echo "   │    8) 🔃 Reset Spamster                           │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    9) 🚪 Exit                                     │";
echo "   └───────────────────────────────────────────────────┘";
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
  
  # Pattern 0
  0)  echo "📡 Download/update relays list" 
    cd ../dl-relays-list
   ./dl-relays-list.sh
  source ../menu/START.sh ;;


  
  # Pattern 1
  1)  echo "== 🔑 (re)Generate keys for each name ==" 
    cd ../keygen
   ./keygen.sh
  source ../menu/START.sh ;;
  

  
  # Pattern 2
  2)  echo "== ⛏️ (re)Generate POW-keys for each name ==" 
    cd ../keygen-pow
   ./keygen-pow.sh
  source ../menu/START.sh ;;
  

  
  # Pattern 3
  3)  echo "== 📁 (re)Make nostr.json + update profiles =="
  cd ../make-json-nip05
   ./makejson.sh
  source ../menu/START.sh ;;
  

  
  # Pattern 4
  4)  echo "== 📢 🌐 Spam global feed =="
  cd ../send-kind1-public
   ./multi-spamster.sh 
  source ../menu/START.sh ;;
    

  
  # Pattern 5
  5)  echo "== 📢 👨‍👩‍👧‍👧 Spam public channels =="
  cd ../multi-spamster
  ./multi-spamster.sh 
  source ../menu/START.sh ;;
    

  
  # Pattern 6
  6)  echo "== 📢 💬 Spam  DMs =="
  cd ../follow
   ./follow.sh 
  source ../menu/START.sh ;;
  

  
  # Pattern 7
  7)  echo "== 🧅 Enable tor / Switch IP =="
  cd ../tor
   ./tor.sh 
   torify ../menu/START.sh ;;
  
  # Pattern 8
  8)  echo "== 🔃 Reset Spamster =="
  cd ../reset
   ./reset.sh 
  source ../menu/START.sh ;;
  
  
  # Pattern 9
  9)  echo "🚪 Exit"
      exit;;

  # Default Pattern
  *) echo " ❌ ERROR ❌  "
    echo "    $choice is not a valid number..."
    echo "     └─> Enter your choice [1-8]:";;
esac
  echo " "
done

