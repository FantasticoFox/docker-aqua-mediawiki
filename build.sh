#!/usr/bin/env bash

set -euo pipefail

tweeki_version=2.0.3
pdfembed_version=2.0.2
embedvideo_version=2.9.0

mkdir -p skins
if [ ! -d skins/Tweeki ]; then
    echo "Downloading Tweeki skin"
    wget https://github.com/thaider/Tweeki/archive/refs/tags/v${tweeki_version}.tar.gz
    tar xf v${tweeki_version}.tar.gz
    mv Tweeki-* skins/Tweeki
fi

mkdir -p extensions

# https://www.mediawiki.org/wiki/Extension:PDFEmbed
if [ ! -d extensions/PDFEmbed ]; then
    echo "Downloading PDFEmbed"
    wget https://gitlab.com/hydrawiki/extensions/PDFEmbed/-/archive/${pdfembed_version}/PDFEmbed-${pdfembed_version}.zip
    unzip PDFEmbed-${pdfembed_version}.zip
    mv PDFEmbed-${pdfembed_version}/ extensions/PDFEmbed
fi

# https://github.com/wikimedia/mediawiki-extensions-intersection
# We have a problem getting a permanent download url for this extension.
#if [ ! -d extensions/intersection ]; then
#    echo "Downloading intersection"
#    wget
#fi

# Is commented out because the extension is deprecated in it's current version in MW 1.37.X
# https://www.mediawiki.org/wiki/Extension:EmbedVideo
# Disabled per stakeholder request in DataAccounting/issues/189
# if [ ! -d extensions/EmbedVideo ]; then
#     echo "Downloading EmbedVideo"
#     wget https://gitlab.com/hydrawiki/extensions/EmbedVideo/-/archive/v${embedvideo_version}/EmbedVideo-v${embedvideo_version}.zip
#     unzip EmbedVideo-v${embedvideo_version}.zip
#     mv EmbedVideo-v${embedvideo_version} extensions/EmbedVideo
# fip
docker build -t inblockio/micro-pkc-mediawiki .
