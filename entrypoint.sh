#!/bin/bash

# install stata
mkdir ~/Downloads
cd ~/Downloads
wget $1
mv $2 Stata$3Linux64.tar.gz
cd /tmp/
mkdir statafiles
cd statafiles
tar -zxf ~/Downloads/Stata$3Linux64.tar.gz
cd /usr/local
mkdir stata$3
cd stata$3
yes | /tmp/statafiles/install
export PATH=/usr/local/stata$3:$PATH
./stinit << EOF
y
y
$4
$5
$6
y
y
$7
$8
y
EOF

# clone repo
git clone $9

# run do-file
cd $10
/usr/local/stata$3/stata -b do main
cat main.log
