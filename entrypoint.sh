#!/bin/bash

# install stata
mkdir ~/Downloads
cd ~/Downloads
wget -O Stata$2Linux64.tar.gz $1
cd /tmp/
mkdir statafiles
cd statafiles
tar -zxf ~/Downloads/Stata$2Linux64.tar.gz
cd /usr/local
mkdir stata$2
cd stata$2
yes | /tmp/statafiles/install
export PATH=/usr/local/stata$2:$PATH
./stinit << EOF
y
y
$3
$4
$5
y
y
$6
$7
y
EOF

# back to the default working directory
cd /github/workspace

# run do-file
ls -la /usr/local/stata$2/
which stata
/usr/local/stata$2/$8 -b do main
cat main.log
