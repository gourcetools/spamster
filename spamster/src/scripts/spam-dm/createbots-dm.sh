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
for d in ./* ; do
    echo "dir: $d"
    cd $d/src/scripts/spam-dm
    x-terminal-emulator -e ./spam-dm.sh &
    cd ../../../../
done
cd ../spamster/src/scripts/spam-dm
