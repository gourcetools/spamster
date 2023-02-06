#!/bin/bash
echo "================================"
echo " NIP-05 GITHUB UPLOADER FOR SPAMSTER"
echo "================================="
echo "Enter your Github username: "
read username
echo "Enter your Github password: "
read password
echo "Enter your Github token: "
read token
echo "================================="

# Check if repository already exists
curl -u "$username:$password" -H "Authorization: token $token" -I https://api.github.com/repos/$username/$username.github.io > /dev/null 2>&1

if [ $? -eq 0 ]; then
  # If it exist, Update nostr.json:
  # Clone it first
  git clone https://github.com/$username/$username.github.io
  # Copy content from nostr.json to repo folder
  cp ../../json/nostr.json $username.github.io/.well-known/nostr.json
  # Navigate and init  
  cd $username.github.io
  git init
  # Add changes to commit
  git add .well-known/nostr.json
  # Prepare commit
  git commit -m "Upload nostr.json"
  # Add origin
  git remote add origin git@github.com:$username/$username.github.io.git
  # And finally push 
  git push https://$username:$token@github.com/$username/$username.github.io.git
  
else
  # Create repository
  echo Creating repo 
  curl -u "$username:$password" -H "Authorization: token $token" -X POST -d '{"name":"'$username'.github.io"}' https://api.github.com/user/repos
  # Publish nostr.json
  echo Publish
  curl -u "$username:$password" -H "Authorization: token $token" -X PUT -d '{"message":"Upload nostr.json","content":"'$(base64 < ../../json/nostr.json | tr -d '\n')'"}' https://api.github.com/repos/$username/$username.github.io/contents/.well-known/nostr.json
fi

rm -f -d -r ./$username.github.io
