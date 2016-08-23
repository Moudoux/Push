#!/bin/bash

# Push binary

SYNTAX="\"push <File> <Destination>\""

# Push settings (Edit these to match your server)
PW='password'
PORT="22"
SERVER="127.0.0.1"
USERNAME="username"

# Promt for SCP password everytime or use sshpass ?
# true = Promt for password everytime, false = Automatically put password
PWPROMPT="false"

if [ -z "$1" ]; then
	echo "Please specify a file to upload with $SYNTAX."
	exit
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
