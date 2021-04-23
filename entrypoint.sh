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

# install stata kernel
python3.6 -m pip install stata_kernel
python3.6 -m stata_kernel.install
python3.6 -m pip show stata_kernel

# find config file
find / -type f -name '.stata_kernel.conf'

# setup stata_kernel configurations
tee -a /github/home/.stata_kernel.conf << END
[stata_kernel]

# Path to stata executable. If you type this in your terminal, it should
# start the Stata console
# $2 refers to Stata version
stata_path = /usr/local/stata$2/stata

# **macOS only**
# The manner in which the kernel connects to Stata. Either 'console' or
# 'automation'. 'console' is the default because it allows multiple
# independent sessions of Stata at the same time.
execution_mode = console

# Directory to hold temporary images and log files
cache_directory = ~/.stata_kernel_cache

# Whether autocompletion suggestions should include the closing symbol
# (i.e. ``'`` for a local macro or `}` if the global starts with `${`)
autocomplete_closing_symbol = False

# Extension and format for images
graph_format = svg

# Scaling factor for graphs
graph_scale = 1

# List of user-created keywords that produce graphs.
# Should be comma-delimited.
user_graph_keywords = coefplot,vioplot
END

# check whether stata has been added to jupyter kernel
cat /github/home/.stata_kernel.conf
jupyter kernelspec list

# back to the default working directory
cd /github/workspace

# run do-file
/usr/local/stata$2/stata -b do main, nostop
cat main.log
cat /github/home/.stata_kernel_cache/console_debug.log
