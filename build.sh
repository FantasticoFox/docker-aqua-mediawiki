#!/usr/bin/env bash

set -ex
mkdir -p extensions
if [ ! -d extensions/Medik ]; then
    echo "Downloading Medik skin"
    wget https://bitbucket.org/wikiskripta/medik/get/master.tar.gz
    tar xf master.tar.gz
    mv wikiskripta-medik-* extensions/Medik
fi

docker build -t aqua-1.35 .
