unset IP
IP=$($tor wget -qO- http://ipecho.net/plain)
echo "";
echo "   ███████████████████████████████████████████████████";
echo "   █─▄▄▄▄█▄─▄▄─██▀▄─██▄─▀█▀─▄█─▄▄▄▄█─▄─▄─█▄─▄▄─█▄─▄▄▀█";
echo "   █▄▄▄▄─██─▄▄▄██─▀─███─█▄█─██▄▄▄▄─███─████─▄█▀██─▄─▄█";
echo "   ▀▄▄▄▄▄▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀";
echo "     └─> 🌐 https://github.com/gourcetools/spamster ";
echo "-----------------------------------------------------";
echo "-------------- 🤖 Welcome to Spamster 🤖 ----------- ";
echo "---------  Version: 0.1.4 | Liscence: MIT  -----------";
echo "------------ 🧪 FOR RESEARCH USE ONLY 🧪 -------------";

echo "                  ┌─────────────────┐";
echo "                  │   📜 MAIN MENU  │";
echo "   ┌──────────────┴─────────────────┴──────────────────┐";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │      D) 📡 Download raw relays list               │";
echo "   │      P) 🏓 Ping relays list         	     │";
echo "   │      B) 📡 Benchmark relays list                  │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │            🔧 ACCOUNTS MANAGEMENT 🔧              │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    K) 🔑 Generate keys for each name              │";
echo "   │ or W) ⛏️ Generate POW-keys for each name           │";
echo "   │     M) 📁 Make a nostr.json for NIP-05 	       │";
echo "   │                             & update profiles     │";  
echo "   ├───────────────────────────────────────────────────┤";
echo "   │            🕹️ SPAM MANAGEMENT 🕹️                    │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    G) 📢 🌐 Spam Global feed                      │";
echo "   │    C) 📢 📺  Spam public Channels                 │";
echo "   │    I) 📢 💬  Spam Inbox                            │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    R) 🔃 Reset Spamster                          │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    X) 🚪 EXIT                                    │";
echo "   └───────────────────────────────────────────────────┘";
echo -n "    └─> Enter your choice:";

# Running a forever loop using while statement
# This loop will run untill select the exit option.
# User will be asked to select option again and again
while :
do
# reading choice
read choice
# case statement is used to compare one value with the multiple cases.
case $choice in
  
  # Pattern Dd
  [Dd])  echo " == 📡 Download raw relays list" 
    cd ../dl-relays-list
   ./dl-relays.sh
   ../menu/START.sh ;;
  
  # Pattern Pp
  [Pp])  echo " == 🏓 Ping relays list" 
    cd ../ping-relays-list
   ./ping-relays.sh
   ../menu/START.sh ;;
    
  
  
  
  # Pattern Kk
  [Kk])  echo " == 🔑 (re)Generate keys for each name" 
    cd ../keygen
   ./keygen.sh
   ../menu/START.sh ;;
  
  
  # Pattern Ww
  [Ww])  echo " == ⛏️ (re)Generate POW-keys for each name" 
    cd ../keygen-pow
   ./keygen-pow.sh
   ../menu/START.sh ;;
  
  
  # Pattern Mm
  [Mm])  echo " == 📁 Make nostr.json + update profiles"
  cd ../make-json-nip05
   ./makejson.sh
   ../menu/START.sh ;;
  
  
  # Pattern Gg
  [Gg])  echo " == 📢 🌐 Spam global feed"
  cd ../send-kind1-public
   ./CONFIG-SPAM.sh 
   ../menu/START.sh ;;
    
  
  # Pattern Cc
  [Cc])  echo " == 📢 👨‍👩‍👧‍👧 Spam public channels"
  cd ../multi-spamster
  ./multi-spamster.sh 
   ../menu/START.sh ;;
    
  
  # Pattern Ii
  [Ii])  echo " == 📢 💬 Spam  Inbox"
  cd ../follow
   ./follow.sh 
   ../menu/START.sh ;;
  
  
  # Pattern Rr
  [Rr])  echo " == 🔃 Reset Spamster"
  cd ../reset
   ./reset.sh 
   ../menu/START.sh ;;
  
  
  # Pattern Xx
  [Xx])  echo "🚪 Exit"
      exit;;
      
  # Default Pattern
  *) 
  echo "❌ ERROR ❌  "
  echo " $choice is not valid..."
  echo "  └─> Enter your choice:";;

esac
echo "."
done
