#!/bin/bash

VERSION="0.1 Beta"

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