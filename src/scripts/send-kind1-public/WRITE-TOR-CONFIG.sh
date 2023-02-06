# Generate random password for each bot
password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
# Hash it for tor config file
hashed_password=$(tor --hash-password "$password")

# Create dir needed for tor
mkdir -p etc/
mkdir -p tordata$number/

# Write config file
echo "SOCKSPort $port" > 	etc/torsocks.conf$number
echo "ControlPort $control_port" >> etc/torsocks.conf$number
echo "HashedControlPassword $hashed_password" >> etc/torsocks.conf$number
echo "DataDirectory" tordata$number >> etc/torsocks.conf$number
echo "ExitNodes *" >> etc/torsocks.conf$number

# Save instance and port number for later use in another script 
echo "$number" > NUMBER
echo "$port" > PORT

# Add to variable count
let "number+=1"
let "port+=2"
let "control_port+=2"
echo " == Done Writing config file"
