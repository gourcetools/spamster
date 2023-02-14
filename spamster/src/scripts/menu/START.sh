echo "";
echo "";
echo "";
echo "   ███████████████████████████████████████████████████";
echo "   █─▄▄▄▄█▄─▄▄─██▀▄─██▄─▀█▀─▄█─▄▄▄▄█─▄─▄─█▄─▄▄─█▄─▄▄▀█";
echo "   █▄▄▄▄─██─▄▄▄██─▀─███─█▄█─██▄▄▄▄─███─████─▄█▀██─▄─▄█";
echo "   ▀▄▄▄▄▄▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀";
echo "     └─> 🌐 https://github.com/gourcetools/spamster ";
echo " ";
echo "-------------- 🤖 Welcome to Spamster 🤖 ----------- ";
echo "---------  Version: 0.1.7 | Liscence: MIT  -----------";
echo "------------ 🧪 FOR RESEARCH USE ONLY 🧪 -------------";
echo " ";
echo "                  ┌─────────────────┐";
echo "                  │   📜 MAIN MENU  │";
echo "   ┌──────────────┴─────────────────┴──────────────────┐";
echo "   │------------- 📶 RELAYS MANAGEMENT 📶 -------------│";
echo "   │                                                   │";
echo "   │  D) 📡 Download relays list                       │";
echo "   │  P) 🏓 Download + Ping relays list                │";
echo "   │  B) 📈 Download + Benchmark relays list           │";
echo "   │                                                   │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │------------ 🔧 ACCOUNTS MANAGEMENT 🔧 ------------│";
echo "   │                                                   │";
echo "   │  K) 🔑 Generate keys for each name                │";
echo "   │  J) 📁 Create a nostr.json 	     | NIP-05  │";
echo "   │                                                   │";
echo "   │  0) ℹ️  Broadcast profile informations   | KIND:0  │";
echo "   │  3) 🫂 Broadcast follow-list            | KIND:3  │";
echo "   │                                                   │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │--------------- 🕹️  SPAM MANAGEMENT 🕹️  -------------│";
echo "   │                                                   │";
echo "   │  1) 📢 🌐 Spam Global feed              | KIND:1  │";
echo "   │                                                   │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │----------------- ⚙️  SETTINGS ⚙️  ------------------│";
echo "   │                                                   │";
echo "   │  S) ⬆️  SAVE config                                │";
echo "   │  L) ⬇️  LOAD config                                │";
echo "   │  R) 🔃 RESET Spamster                             │";
echo "   │                                                   │";
echo "   │  X) 🚪 EXIT                                       │";
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
  [Pp])  echo " == 🏓 Download + Ping relays list" 
    cd ../ping-relays-list
   ./ping-relays.sh
   ../menu/START.sh ;;
    
    # Pattern Bb
  [Bb])  echo " == 📈 Download + Benchmark relays list" 
    cd ../benchmark-relays-list
   ./benchmark-relays.sh
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
  [Jj])  echo " == 📁 Make a nostr.json for NIP-05"
  cd ../make-json-nip05
   ./makejson.sh
   ../menu/START.sh ;;
   

  # Pattern 0
  0)  echo "   │     0) 📁 Broadcast profile informations KIND:0  │"
  cd ../broadcast-profile-infos
   ./broadcast-profile-infos.sh
   ../menu/START.sh ;;

  # Pattern 3
  3)  echo "   │     3) 📁 Broadcast follow-list KIND:3  │"
    cd ../make-contact-list
   ./make-contact-list.sh
  cd ../broadcast-contact-list
   ./broadcast-contact-list.sh
   ../menu/START.sh ;;
 
  
  
  # Pattern Gg
  1)  echo " == 📢 🌐 Spam global feed"
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
  [Ss])  echo " == ⬆️ Save configuration"
  cd ../config-saver
   ./config-saver.sh 
   ../menu/START.sh ;;
   
   
     # Pattern Rr
  [Ll])  echo " == ⬇️ Load configuration"
  cd ../config-loader
   ./config-loader.sh
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
