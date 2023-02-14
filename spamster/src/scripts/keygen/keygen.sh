#!/bin/bash
# keygen.sh
clear
echo " "
echo " "
echo "          \│/  ┬┌─┌─┐┬ ┬┌─┐┌─┐┌┐┌  \│/   ";
echo "       ──── ─  ├┴┐├┤ └┬┘│ ┬├┤ │││  ─ ────";
echo "          /│\  ┴ ┴└─┘ ┴ └─┘└─┘┘└┘  /│\   ";
echo " "
echo " "
sleep 1

# Start timer
start_time=$(date +%s)

# Calculate numbers of processors for xarg
num_processors=$(grep -c ^processor /proc/cpuinfo)
xarg_p=$((num_processors - 1))

# Create necessary directories
mkdir -p ../../tmp \
         ../../json \
         ../../keys/pubkeys \
         ../../keys/privkeys \
         ../../keys/names

# Clear old files
rm -f ../../tmp/* \
      ../../keys/pubkeys/* \
      ../../keys/privkeys/*

# Replace spaces with dashes 
sed -i 's/ /-/g' ../../../config/names-list.txt

# Get the number of lines in names-list.txt
lines=$(wc -l < "../../../config/names-list.txt")

# Run keygen command for each name in names-list.txt
cat ../../../config/names-list.txt | xargs -I {} -P $xarg_p sh -c '
    echo "  == 🔑 🗝️  Generating keypair for:  {} "
    keypair=$(clust generate-keypair)
    pubkey=$(echo "$keypair" | grep -Po "(?<=Public key: ).*")
    privkey=$(echo "$keypair" | grep -Po "(?<=Private key: ).*")
    echo "$pubkey" > "../../keys/pubkeys/{}.txt"
    echo "$privkey" > "../../keys/privkeys/{}.txt"
'

# Export all privkeys to privkeys-list.txt
cd ../../keys/privkeys
find . -type f -name '*.txt' -print0 | sort -z | xargs -0 cat > ../../../config/privkeys-list.txt
cd ../../scripts/keygen


# End timer
end_time=$(date +%s)

# Calculate total time
total_time=$((end_time - start_time))

# Print total time and number of lines
echo " "
echo " "
echo "          \│/  ┌┬┐┌─┐┌┐┌┌─┐  ┬  \│/   "
echo "       ──── ─   │││ ││││├┤   │  ─ ────"
echo "          /│\  ─┴┘└─┘┘└┘└─┘  o  /│\   "
echo "       	Generated $lines keypairs"
echo "       	in $total_time seconds."
sleep 2
