#!/bin/bash
#keygen.sh


# Get the number of lines in names-list.txt
lines=$(wc -l < "../../../config/names-list.txt")

# Start timer
start_time=$(date +%s)

mkdir -p ../../tmp					
mkdir -p ../../json				
mkdir -p ../../keys/pubkeys		
mkdir -p ../../keys/privkeys	 
mkdir -p ../../keys/names	 



rm -f ../../tmp/*		
rm -f ../../keys/pubkeys/*
rm -f ../../keys/privkeys/*


## run command for each name in names-list
while read line
do

# ===================================================================================== #
# ===========	Generate a keypair in HEX32 using clust 				#
# ===================================================================================== #
echo " == Generating keypair for $line"
clust 		generate-keypair > 	../../tmp/Keypair.txt
# ===================================================================================== #
# ===========	Split the keypair into Pub.txt and Priv.txt 				#
# ===================================================================================== #
sed '1d'	../../tmp/Keypair.txt 	> 	../../tmp/Pub.txt
sed '2d'	../../tmp/Keypair.txt 	> 	../../tmp/Priv.txt
# ===================================================================================== #
# =============	Delete Keypair.txt, we dont need it anymore 				#
# ===================================================================================== #
rm -f 					../../tmp/Keypair.txt
# ===================================================================================== #
# =====	Remove stuff that we dont need so we only keep the raw keys inside the files 	#
# ===================================================================================== #
sed -E -i 's/.*(.{64})$/\1/'		../../tmp/Pub.txt
sed -E -i 's/.*(.{64})$/\1/'		../../tmp/Priv.txt
# ===================================================================================== #
#  ==========	Assign a random number for each key pair 				#
#  ==========	Move the key to pubkeys and privkeys folder 				#
# ===================================================================================== #
mv 		"../../tmp/Pub.txt" 		"../../keys/pubkeys/$line.txt"
mv 		"../../tmp/Priv.txt"		"../../keys/privkeys/$line.txt"
# ===================================================================================== #


done < ../../../config/names-list.txt



cd ../../keys/privkeys
cat *.txt | sort -n > ../../../config/privkeys-list.txt
cd ../../scripts/keygen





# copy all files from pubkeys to names
rm -f ../../keys/names/*

cp ../../../config/names-list.txt ./names.txt
cp ../../keys/pubkeys/* ../../keys/names

# replace the content of each file in names with a line from names.txt
cd ../../keys/names/
for file in *
do
  sed -i "1s/.*/$(head -n 1 ../../scripts/keygen/names.txt)/" $file
  sed -i "1d" ../../scripts/keygen/names.txt
done
cd ../../scripts/keygen
rm -f ./names.txt



# End timer
end_time=$(date +%s)

# Calculate total time
total_time=$((end_time - start_time))

# Print total time and number of lines
echo "Total time: $total_time seconds"
echo "Number of lines in names-list.txt: $lines"

######
