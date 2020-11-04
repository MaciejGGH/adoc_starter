FROM ubuntu:latest

RUN mkdir /adoc

RUN apt-get update \
&& apt-get install -y default-jre asciidoctor pandoc bash

RUN gem install asciidoctor-diagram asciidoctor-pdf \
&& apt-get install -y graphviz

COPY test.adoc /adoc

ENTRYPOINT ["/bin/bash"]