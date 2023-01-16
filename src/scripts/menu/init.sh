#!/bin/bash
# init.sh
    cd ../keygen
   ./keygen.sh
   ./name.sh
   
  cd ../make-json-nip05
   ./makejson.sh
   
  cd ../follow
   ./follow.sh 

    echo "     └─> done bro "