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

echo "Installing sshpass..."

sudo apt-get install sshpass

echo "Installing Push..."

mkdir ~/bin &> /dev/null
rm ~/bin/push.sh &> /dev/null
cp push.sh ~/bin/push.sh &> /dev/null

RCFILE=~/.bashrc
INSTALLFILE=~/bin/push.sh

if grep -q 'alias push="bash ~/bin/push.sh"' "$RCFILE"; then
	echo "Command alias already installed... Skipping..."
else
	echo 'alias push="bash ~/bin/push.sh"' >> ~/.bashrc
fi

alias push="bash ~/bin/push.sh"

echo "Installation done"
echo "Please change the settings in \"$INSTALLFILE\" to match your server"