#!/bin/bash

TAR_GZ=$(curl -s https://dlcdn.apache.org/jena/binaries/ | grep "tar.gz\"" | grep "apache-jena-fuseki" |cut -d'"' -f6)
echo $TAR_GZ
