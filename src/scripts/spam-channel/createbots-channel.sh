mkdir -p ../../../../multi-spamster
rm -f -r ../../../../multi-spamster/*
echo "Enter how many bots you want to create below"
read count
i=0
while (( i++ < $count )); do
  cp -r "../../../../spamster" "../../../../multi-spamster/spamster$i"
echo "Done making $count bots"
echo "Lets start them"
done


cd ../../../../multi-spamster
ls
for d in ./* ; do
    echo "dir: $d"
    ls
    cd $d/src/scripts/spam-channel
    ls
    x-terminal-emulator -e ./spam-channel.sh &
    cd ../../../../
done
cd ../spamster/src/scripts/spam-channel
