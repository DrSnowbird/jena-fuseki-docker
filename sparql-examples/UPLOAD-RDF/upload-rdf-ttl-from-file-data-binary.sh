#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:13030/rdf001/" -H "Content-Type: application/trig" -H "Accept: application/sparql-results+json" --data-binary "@SusanJohns-graph.ttl.trig"

# -- if using absolute file path in data-binary: ---
#curl -L -X POST "http://0.0.0.0:13030/rdf002/" -H "Content-Type: application/trig" -H "Accept: application/sparql-results+json" --data-binary "@/mnt/user1/DATA/tmp/jena-fuseki-docker/SPARQL-examples/UPLOAD-RDF/SusanJohns-graph.ttl.trig"

