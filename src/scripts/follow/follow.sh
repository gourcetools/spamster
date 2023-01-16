#!/bin/bash


cd ../../keys/pubkeys
for file in *.txt;
do 
	privkey=$(cat ../privkeys/$file)
  noscl setprivate $privkey
  cd ../pubkeys
  for file in *.txt;
    do 
      pubkey=$(cat $file)
      # noscl follow $pubkey
    done  
  noscl follow 59f7db369313971d4c9bd4abb1ccadb32b89d63b5556021c66646ac8a13f33a4
  noscl share-contacts
  echo "== Broadcasting follow list for $file =="
done
cd ../../scripts









