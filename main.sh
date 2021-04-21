#!/bin/bash

AUTHORIZATION=$1
CODE=$2
FIRST_NAME=$3
LAST_NAME=$4
OLD_FILE=$5
SERIAL_NUMBER=$6
URL=$7
VERSION=$8

echo "$URL"

# mkdir ~/Downloads
# cd ~/Downloads
# wget $URL
# mv $OLD_FILE Stata${VERSION}Linux64.tar.gz
# cd /tmp/
# sudo mkdir statafiles
# cd statafiles
# sudo tar -zxf ~/Downloads/Stata${VERSION}Linux64.tar.gz
# cd /usr/local
# sudo mkdir stata${VERSION}
# cd stata${VERSION}
# sudo yes | sudo /tmp/statafiles/install
# export PATH=/usr/local/stata${VERSION}:$PATH
# sudo ./stinit << EOF
# y
# y
# $SERIAL_NUMBER
# $CODE
# $AUTHORIZATION
# y
# y
# $FIRST_NAME
# $LAST_NAME
# y
# EOF
# which stata
# cd ~
# /usr/local/stata${VERSION}/stata -b do main
# cat main.log
