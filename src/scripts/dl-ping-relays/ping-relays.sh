wget https://raw.githubusercontent.com/dskvr/nostr-watch/develop/relays.yaml
sed -i "1d" relays.yaml
cat relays.yaml | sed 's/^.\{10\}//' > urllist.txt
rm -f relays.yaml
sed -i '/\//d' urllist.txt

# ping the urls in urllist.txt and sort them by ping
cat urllist.txt | while read LINE
do
    echo "pinging $LINE"
    timeout 0.5 ping -c 1 $LINE | tail -n 1 | awk '{print $4}' | cut -d '/' -f 2 | sed "s/$/$LINE/" >> sorted.txt
done

sort -n sorted.txt > ipsorted.txt
rm sorted.txt

while read line; do
	echo ${line} | sed -e 's/[^A-Za-z. ]//g'>>under1srelays.txt
done <ipsorted.txt
rm -f ipsorted.txt

#sed remove first character wich is a dot from the ping... cleaning
sed -i 's/^.//' under1srelays.txt
head -n 100 under1srelays.txt > relays-list.txt
rm -f under1srelays.txt
rm -f urllist.txt