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
echo $8
if [ $8 == "stata" ]; then
    echo $8
    stata -b do main
elif [ $8 == "stata-se" ]; then
    echo $8
    stata-se -b do main
elif [ $8 == "stata-mp" ]; then
    echo $8
    stata-mp -b do main
fi

# print log result
cat main.log

# Fail CI if Stata ran with an error
EXIT_CODE=$(tail -1 main.log | tr -d '[:cntrl:]')

if [[ ${EXIT_CODE:0:1} == "r" ]]; then
    exit 1
fi
