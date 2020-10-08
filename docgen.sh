#!/bin/bash
if [ -z "$2" ] || [ $2 = "html" ]; then
    asciidoctor -r asciidoctor-diagram -a data-uri -a toc -a toclevels=5 -a source-highlighter=rouge $1
else
    if [ $2 = "docx" ]; then
        asciidoctor -b docbook5 -r asciidoctor-diagram -a data-uri -a toc -a toclevels=5 -a source-highlighter=rouge --out-file - $1| \
        pandoc --toc --from docbook --to docx --output "${1/.adoc/}".docx
    elif [ $2 = "pdf" ]; then
        asciidoctor-pdf -r asciidoctor-diagram -a data-uri -a toc -a toclevels=5 -a source-highlighter=rouge $1
    fi
fi