#!/usr/bin/env bash

set -ex

mkdir -p skins
if [ ! -d skins/Tweeki ]; then
    echo "Downloading Tweeki skin"
    wget https://github.com/thaider/Tweeki/archive/refs/tags/v1.2.6.tar.gz
    tar xf v1.2.6.tar.gz
    mv Tweeki-* skins/Tweeki
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
docker build -t fantasticofox/pkc .
