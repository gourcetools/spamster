#!/bin/bash
# keygen.sh
num_processors=$(grep -c ^processor /proc/cpuinfo)
xarg_p=$((num_processors - 1))
echo $xarg_p
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
cat ../../../config/names-list.txt | xargs -I {} -P $xarg_p sh -c '
    echo "Generating keypair for {}"
    keypair=$(clust generate-keypair)
    pubkey=$(echo "$keypair" | grep -Po "(?<=Public key: ).*")
    privkey=$(echo "$keypair" | grep -Po "(?<=Private key: ).*")
    echo "$pubkey" > "../../keys/pubkeys/{}.txt"
    echo "$privkey" > "../../keys/privkeys/{}.txt"
'
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
