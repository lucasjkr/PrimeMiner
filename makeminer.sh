#! /bin/bash
#
# This script downloads and compiles primecoind 
# in order to turn a virtual machine instance into 
# a primecoin miner
#
# Tested under Ubuntu Server 12.10; should work on Desktop 
# version and version 13; Might work on Debian and other 
# Debian based packages.


clear
echo "Enter your password for 'sudo' tasks that need to occur"
read -s password
echo -E "Thank you! Continuing..."


# we need to get git-core in advance, otherwise we can't download the script (SEE INSTRUCTIONS).
# but, if you've gotten the code onto your machine withoug git'ing it, then either uncomment the line below
# or simply run it your self ("sudo apt-get install git-core")
#
# echo $password | sudo -S apt-get install -y git-core

echo $password | sudo -S apt-get update
echo $password | sudo -S apt-get install -y build-essential libssl-dev libboost-all-dev libdb5.1-dev libdb5.1++-dev libgtk2.0-dev
echo $password | sudo -S apt-get install -y libminiupnpc-dev libgmp-dev

# need to figure out how to install and configure postfix silently. Til then, this is commented out.
#
# sudo apt-get install mailutils
#
#
# Now, create bin and src directory in home folder, 
# download primecoin and compile

mkdir /$HOME/src
mkdir /$HOME/bin
cd /$HOME/src
git clone https://github.com/primecoin/primecoin.git
cd /$HOME/src/primecoin/src/
make -f makefile.unix "USE_UPNP=-"

mv /$HOME/src/primecoin/src/primecoind /$HOME/bin/primecoind
export PATH=$PATH:/$HOME/bin/

mkdir /home/$USER/.primecoin
echo "15" > $HOME/InstallProgress.txt
touch /.primecoin/primecoin.conf
echo "17" > $HOME/InstallProgress.txt
echo -e "rpcuser="$RANDOM$USER$RANDOM"user\nrpcpassword="$RANDOM$HOME$RANDOM$RANDOM"\nrpcport=8021\ngen=1" > $HOME/.primecoin/primecoin.conf
#
# this would be put into thhe config file if mail was set up:
# alertnotify=echo %s | mail -s "Primecoin Alert" admin@foo.com
#
#
chmod 600 $HOME/.primecoin/primecoin.conf

primecoind --daemon

watch 'primecoind getmininginfo'

# primecoind -printtoconsole
# watch 'primecoind getinfo'
