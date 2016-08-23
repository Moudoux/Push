#!/bin/bash

VERSION="0.2 Beta"

# Push binary

SYNTAX="\"push <File> <Destination>\""

# Import settings
source settings.sh

# Promt for SCP password everytime or use sshpass ?
# true = Promt for password everytime, false = Automatically put password
PWPROMPT="false"

if [ -z "$1" ]; then
	echo "Please specify a file to upload with $SYNTAX."
	exit
fi

if [ "$1" = "-v" ]; then
	echo "You are running Push version $VERSION"
	exit;
fi

if [ "$1" = "-h" ]; then
	echo "Push commands: push [-v (version)| -u (upgrade) | -h (help) | <Source file>] <Destination file>"
	exit;
fi

if [ "$1" = "-u" ]; then	
	echo "Upgrading Push..."
	echo "Downloading Push binary..."
	
	mkdir ~/push_temp &> /dev/null
	cd ~/push_temp
	
	wget https://raw.githubusercontent.com/Moudoux/Push/master/push.sh &> /dev/null
	
	rm ~/bin/push.sh &> /dev/null
	cp push.sh ~/bin/push.sh &> /dev/null
	
	cd ~/
	
	rm -R ~/push_temp &> /dev/null
	
	echo "Push has been updated to the latest version"
	
	exit;
fi

if [ -z "$2" ]; then
	echo "Please specify where to upload the file with $SYNTAX."
	exit
fi

FILE="$1"
REMOTE_PATH="$2"

echo "Pushing $FILE to $REMOTE_PATH..."

if [ "$PWPROMPT" = "true" ]; then

	# Manual
	scp -P $PORT $FILE $USERNAME@$SERVER:$REMOTE_PATH

else

	# Automatic
	sshpass -p "$PW" scp -P $PORT $FILE $USERNAME@$SERVER:$REMOTE_PATH
	
fi

echo 'Push successful'
