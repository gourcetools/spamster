echo '["REQ", "RAND", {"kinds": [40], "limit": 10000}]' |   nostcat wss://relay.nostr.ch |   jq '.[2].pubkey' > pubkeys.txt
awk '!seen[$0]++' pubkeys.txt > pubkeys-list.txt
awk '{print substr($0,2,length()-2);}' pubkeys-list.txt > pubkeys-list2.txt
