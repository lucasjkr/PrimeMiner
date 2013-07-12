PrimeMiner
==========

Turn an Ubuntu Server into a Primecoin miner in one easy script.

This is a bash script that turns downloads all the tools needed to compile primecoind, compiles the code and starts the miner for you. 

For myself, I've been setting up Ubuntu servers and only selecting the OpenSSH Server package.

It seems to run without any problems on Ubuntu Server 12.04 and 12.10, your mileage may vary though.

Improvements I'd like to implement ar:e

* Error checking
* Having it work across a broader range of OS's (ie right now it'll probably work under any Debian based OS, but it would be great if it could also work under Fedora or CentOS)
* Determining number of processors and allowing user to determine how many processors they'ed like to have set to generate coins.

I know it's probably lousy security practice to ask for the password for 'sudo', but I've only been running it on instances solely dedicated to mining, so nothing really to lose except a couple of coins if somoene manages to extract it.

STEPS
=====

Install Ubuntu Server with OpenSSH Server package (so you can login and administer it remotely)

Get the git software, download and run:

>  sudo apt-get install git-core
>  git clone https://github.com/lucasjkr/PrimeMiner.git
>  chmod 700 ./PrimeMiner/makeminer.sh
>  ./PrimeMiner/makeminer.sh


If you like this, feel free to donate to me at any of the following:

XPM: ATPXxYLs7ErFTtibVbtLxhiP4vnivvgfsg
PPC: PWLX6QYiLLZ2KbubBhg5KqYsGSYtM5QxND
LTC: LcBsFaanYuuiRX9uTeRSwqHNcN3wf8WdRR
BTC: 13xMr3NqMGZmZm1c7MEsHFDHgNs5VqMh1e
