#!/bin/bash
echo "======================================="
echo "      Downloading channels list         "
curl -s https://damus.io/channels/ | grep -oP '(?<=<pre>).*(?=</pre>)' > ../../../config/channels.txt
source "emptycheck.sh"