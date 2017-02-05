#!/bin/bash

ROOT="https://www.factorio.com"
DOWNLOADS="tars"
DOWNLOADS_HTML_TMP=downloads.html
mkdir -p $DOWNLOADS



wget $ROOT/download-headless -nv -O $DOWNLOADS_HTML_TMP

grep -oE "/get-download/.*/headless/linux64" $DOWNLOADS_HTML_TMP | while read line; do
    VERSION=$(basename $(dirname $(dirname $line)))
    URL="$ROOT$line"

    printf "%s -> %s\\n" $URL $VERSION

    FILENAME="$DOWNLOADS/linux64-$VERSION.tar.gz"

    #if [ ! -e $FILENAME ]; then
        wget $URL -nv -c -O $FILENAME
    #fi
done

rm $DOWNLOADS_HTML_TMP
