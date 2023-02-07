echo '["REQ","RAND", {"kinds": ['40'],"limit": '1000'}]' | nostcat wss://relay.nostr.band |
  	jq '.[2].id' > ../../../config/channels-list.txt
    sed -i 's/^.\(.*\).$/\1/' ../../../config/channels-list.txt
