#!/usr/bin/env bash

set -euo pipefail

tweeki_version=2.0.3
pdfembed_version=2.0.2

if [ ! -d skins/Tweeki ]; then
    echo "Downloading Tweeki skin"
    wget https://github.com/thaider/Tweeki/archive/refs/tags/v${tweeki_version}.tar.gz
    tar xf v${tweeki_version}.tar.gz
    mv Tweeki-* skins/Tweeki
    rm v${tweeki_version}.tar.gz
fi


# TODO move to composer.local.json
# https://www.mediawiki.org/wiki/Extension:PDFEmbed
if [ ! -d extensions/PDFEmbed ]; then
    echo "Downloading PDFEmbed"
    wget https://gitlab.com/hydrawiki/extensions/PDFEmbed/-/archive/${pdfembed_version}/PDFEmbed-${pdfembed_version}.zip
    unzip PDFEmbed-${pdfembed_version}.zip
    mv PDFEmbed-${pdfembed_version}/ extensions/PDFEmbed
    rm PDFEmbed-${pdfembed_version}.zip
fi
