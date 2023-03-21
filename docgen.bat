@echo off

set TOC_LEVEL=5

set "input=%1"

set "outdocx=%input:.adoc=docx%"

if "%2"=="" (
  asciidoctor -r asciidoctor-diagram -a data-uri -a toc -a toclevels=%TOC_LEVEL% -a source-highlighter=rouge $1
) else (
  if "%2" = "html" (
    asciidoctor -r asciidoctor-diagram -a data-uri -a toc -a toclevels=%TOC_LEVEL% -a source-highlighter=rouge $1
  ) else if "%2"="docx" (
    if [ $2 = "docx" ]; then
        if not exists myref.docx (
            echo "myref.docx not found, creating default one"
            echo "edit myref.docx style Compact, add bold"
            echo "To add table bordersedit myref.docx, click table, design menu, expand styles, modify table style, select borders, save..."
            pandoc --print-default-data-file reference.docx > myref.docx
        )
        asciidoctor -b docbook5 -r asciidoctor-diagram -a data-uri -a toc -a toclevels=%TOC_LEVEL% -a source-highlighter=rouge --out-file - %1| pandoc --reference-doc=myref.docx --toc --from docbook --to docx --output %outdocx%
  ) else if "%2"="pdf" (
        asciidoctor-pdf -r asciidoctor-diagram -a data-uri -a toc -a toclevels=%TOC_LEVEL% -a source-highlighter=rouge %1
  )
)
