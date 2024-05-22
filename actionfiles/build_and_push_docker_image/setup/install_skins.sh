#versions
tweeki_version=2.0.1


if [ ! -d skins/Tweeki ]; then
    echo "Downloading Tweeki skin"
    wget https://github.com/thaider/Tweeki/archive/refs/tags/v${tweeki_version}.tar.gz
    tar xf v${tweeki_version}.tar.gz
    mv Tweeki-* skins/Tweeki
fi