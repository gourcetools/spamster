
echo '["REQ","RAND", {"kinds": ['40'],"limit": '100'}]' | nostcat wss://relay.nostr.ch |
  	jq '.[2].id' > ../../../config/channels-list.txt
    sed -i 's/^.\(.*\).$/\1/' ../../../config/channels-list.txt
