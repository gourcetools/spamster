fulldir=$(pwd)
basename="${fulldir##*/}"
echo "$basename"
mkdir -p ../../../../multi-spamster
# Delete old bots if any
rm -f -r ../../../../multi-spamster/*
echo "== Enter how many bots you want to create:"
read count
i=0
while (( i++ < $count )); do
  cp -r "../../../../spamster" "../../../../multi-spamster/spamster$i"
done
echo " == Done making $count bots"
echo " == Lets start them.."
cd ../../../../multi-spamster
ls
for d in ./* ; do
    echo "dir: $d"	
    cd $d/src/scripts/$basename
    x-terminal-emulator -e ./send-loop.sh &
    cd ../../../../
done
cd ../spamster/src/scripts/multi-spamster
