#!/bin/bash
echo "Welcome to the Push installer, Copyright (C) Alexander 2016"
echo "To continue with the installation, please confirm"
echo "By typing \"Y\" and pressing enter"
read input

if [ "$input" != "Y" ]; then 
    if [ "$input" != "y" ]; then 
		echo "Installation aborted"
		exit
	fi;
fi;

echo "Installing Push requirements..."

echo "Installing wget..."
sudo apt-get install wget

echo "Installing SCP..."
sudo apt-get install scp

echo "Installing sshpass..."
sudo apt-get install sshpass

# Check if binary exists

mkdir ~/push_temp &> /dev/null
cd ~/push_temp

if [ ! -f "push.sh" ]; then
	# Download binary from git
	echo "Push binary not found..."
	echo "Downloading Push binary..."
	wget https://raw.githubusercontent.com/Moudoux/Push/master/push.sh
else 	
	echo "Found push binary"
fi

if [ ! -f "settings.sh" ]; then
	# Download binary from git
	echo "Push sample config file not found..."
	echo "Downloading Push sample config file..."
	wget https://raw.githubusercontent.com/Moudoux/Push/master/settings.sh
else 	
	echo "Found Push sample config file"
fi

INSTALLDIR=~/bin/

echo "Installing Push..."

mkdir ~/bin &> /dev/null
rm ~/bin/push.sh &> /dev/null
cp push.sh ~/bin/push.sh &> /dev/null

if [ ! -f "$INSTALLDIR/settings.sh" ]; then
	echo "Config file not found... Installing new config file..."
	cp settings.sh ~/bin/settings.sh &> /dev/null
else 
	echo "Config file found, will not install new config file"
fi

RCFILE=~/.bashrc

if grep -q 'alias push="bash ~/bin/push.sh"' "$RCFILE"; then
	echo "Command alias already installed... Skipping..."
else
	echo 'alias push="bash ~/bin/push.sh"' >> ~/.bashrc
fi

alias push="bash ~/bin/push.sh"

cd ~/
rm -R ~/push_temp &> /dev/null

echo "Installation done"
echo "Please change the settings in \"$INSTALLDIR/settings.sh\" to match your server"