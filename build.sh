#!/usr/bin/env bash

set -ex

mkdir -p skins
if [ ! -d skins/Medik ]; then
    echo "Downloading Medik skin"
    wget https://bitbucket.org/wikiskripta/medik/get/master.tar.gz
    tar xf master.tar.gz
    mv wikiskripta-medik-* skins/Medik
fi

mkdir -p extensions

# https://www.mediawiki.org/wiki/Extension:PDFEmbed
if [ ! -d extensions/PDFEmbed ]; then
    echo "Downloading PDFEmbed"
    wget https://gitlab.com/hydrawiki/extensions/PDFEmbed/-/archive/2.0.2/PDFEmbed-2.0.2.zip
    unzip PDFEmbed-2.0.2.zip
    mv PDFEmbed-2.0.2/ extensions/PDFEmbed
fi

# https://github.com/wikimedia/mediawiki-extensions-intersection
# We have a problem getting a permanent download url for this extension.
#if [ ! -d extensions/intersection ]; then
#    echo "Downloading intersection"
#    wget 
#fi

# https://www.mediawiki.org/wiki/Extension:EmbedVideo
if [ ! -d extensions/EmbedVideo ]; then
    echo "Downloading EmbedVideo"
    wget https://gitlab.com/hydrawiki/extensions/EmbedVideo/-/archive/v2.9.0/EmbedVideo-v2.9.0.zip
    unzip EmbedVideo-v2.9.0.zip
    mv EmbedVideo-v2.9.0 extensions/EmbedVideo
fi
docker build -t aqua-1.35 .
