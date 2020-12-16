#!/bin/bash

TOC_LEVEL=5

if [ -z "$2" ] || [ $2 = "html" ]; then
    asciidoctor -r asciidoctor-diagram -a data-uri -a toc -a toclevels=$TOC_LEVEL -a source-highlighter=rouge $1
else
    if [ $2 = "docx" ]; then
        if [ ! -f ./myref.docx ]; then
            echo "myref.docx not found, creating default one"
            echo "edit myref.docx style Compact, add bold"
            echo "To add table bordersedit myref.docx, click table, design menu, expand styles, modify table style, select borders, save..."
            pandoc --print-default-data-file reference.docx > myref.docx
        fi
        asciidoctor -b docbook5 -r asciidoctor-diagram -a data-uri -a toc -a toclevels=$TOC_LEVEL -a source-highlighter=rouge --out-file - $1| \
        pandoc --reference-doc=myref.docx --toc --from docbook --to docx --output "${1/.adoc/}".docx
    elif [ $2 = "pdf" ]; then
        asciidoctor-pdf -r asciidoctor-diagram -a data-uri -a toc -a toclevels=$TOC_LEVEL -a source-highlighter=rouge $1
    fi
fi
