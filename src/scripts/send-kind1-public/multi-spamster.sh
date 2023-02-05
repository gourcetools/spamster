#!/bin/bash

fulldir=$(pwd)
basename="${fulldir##*/}"
echo "$basename"
mkdir -p ../../../../multi-spamster
rm -f -r ../../../../multi-spamster/*
echo "== Enter how many bots you want to create:"
read count
while (( i++ < $count )); do
  cp -r "../../../../spamster" "../../../../multi-spamster/spamster$i"
done
echo " == Done making $count bots"
echo " == Lets start them.."
cd ../../../../multi-spamster
ls


number=1
port=9050
control_port=9051




for d in ./* ; do
  echo "Im inside: $d"
  cd $d/src/scripts/$basename
  password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  hashed_password=$(tor --hash-password "$password")
mkdir -p etc/
mkdir -p tordata$number/
ls
  echo "SOCKSPort $port" > 	etc/torsocks.conf$number
  echo "ControlPort $control_port" >> etc/torsocks.conf$number
  echo "HashedControlPassword $hashed_password" >> etc/torsocks.conf$number
  echo "DataDirectory" tordata$number >> etc/torsocks.conf$number
  echo "ExitNodes *" >> etc/torsocks.conf$number
  
  echo "$port" > SOCKSPORT
  echo "$control_port" > CONTROLPORT
  echo "$number" > NUMBER

x-terminal-emulator -e "bash -c './send-loop.sh; bash'" &


  cd ../../../../
  let "number+=1"
  let "port+=10"
  let "control_port+=10"
done
cd ../spamster/src/scripts/multi-spamster



