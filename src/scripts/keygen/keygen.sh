#!/bin/bash
# keygen.sh

# Create directories
mkdir -p ../../tmp
mkdir -p ../../json
mkdir -p ../../keys/pubkeys
mkdir -p ../../keys/privkeys
mkdir -p ../../keys/names

# Delete old files
rm -f ../../tmp/*
rm -f ../../keys/pubkeys/*
rm -f ../../keys/privkeys/*

# Get the number of lines in names-list.txt
lines=$(wc -l < "../../../config/names-list.txt")

# Start timer
start_time=$(date +%s)

# Run command for each name in names-list.txt
for line in $(cat ../../../config/names-list.txt)
do
    # Generate a keypair in HEX32 using clust
    echo " Generating keypair for $line"
    keypair=$(clust generate-keypair)

    # Split the keypair into Pub.txt and Priv.txt
    pubkey=$(echo "$keypair" | grep -Po '(?<=Public key: ).*')
    privkey=$(echo "$keypair" | grep -Po '(?<=Private key: ).*')

    # Move the key to pubkeys and privkeys folder
    echo "$pubkey" > "../../keys/pubkeys/$line.txt"
    echo "$privkey" > "../../keys/privkeys/$line.txt"

done

# Sort privkeys files by name
cd ../../keys/privkeys
find . -type f -name '*.txt' -print0 | sort -z | xargs -0 cat > ../../../config/privkeys-list.txt
cd ../../scripts/keygen

# End timer
end_time=$(date +%s)

# Calculate total time
total_time=$((end_time - start_time))

# Print total time and number of lines
echo "= Done :)
= Created $lines accounts in $total_time seconds."
