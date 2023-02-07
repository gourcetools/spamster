echo " "
echo " "
echo " You asked for it."
echo " "
echo " ============================="
echo " == SPAMSTER RESET STARTED == "
echo " ============================="
cd ../../
echo " = Purging tmp folder"
cd tmp
rm -f *
cd ..
echo " = Purging pubkeys folder"
cd keys/pubkeys
rm -f *
cd ..
echo " = Purging privkeys folder"
cd privkeys
rm -f *
echo " = Purging json"
cd ../../json
rm -f *
cd ../scripts/reset
echo " ============================="
echo " == SPAMSTER RESET DONE == "
echo " ============================="
