#!/bin/bash

echo "=====> sh configuration"
cp .ssh/config ~/.ssh/config

echo "=====> checking meld instalation"
command -v meld >/dev/null 2>&1 || {
	    echo >&2 "====> Merging tool 'meld' is not installed. Installing...";
        sudo apt-get install meld; }


