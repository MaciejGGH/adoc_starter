# adoc_starter

## Assumptions
The scripts should be run in Windows Subsystem for Linux environment. For more information on how to enable wsl please refer [this page](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

## Setup script
setup_adoc.sh - to install all required components will install:

- asciidoctor - used to generate html output
- asciidoctor-diagram - used for diagrams
- asciidoctor-pdf - used to generate pdf output
- pandoc - used to generate docx

## Script to convert adoc to various formats
docgen.sh - this will use above mentioned tools to generate great looking documents in html/pdf/docx format.

**Syntax**: 
`./docgen.sh <your_file.adoc> <desired_ouput [html/docx/pdf]>`

**Example**:
To create Word-compatible document, run:

`./docgen.sh test.adoc docx`

## Sample adoc document
test.adoc - a sample file to play with.
