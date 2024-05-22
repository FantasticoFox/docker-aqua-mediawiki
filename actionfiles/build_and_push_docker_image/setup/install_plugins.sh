#versions
pdfembed_version=2.0.2

# https://www.mediawiki.org/wiki/Extension:PDFEmbed
if [ ! -d extensions/PDFEmbed ]; then
    echo "Downloading PDFEmbed"
    wget https://gitlab.com/hydrawiki/extensions/PDFEmbed/-/archive/${pdfembed_version}/PDFEmbed-${pdfembed_version}.zip
    unzip PDFEmbed-${pdfembed_version}.zip
    mv PDFEmbed-${pdfembed_version}/ extensions/PDFEmbed
fi