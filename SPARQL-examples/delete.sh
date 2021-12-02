#!/bin/bash -x

SPARLQ_URL="http://0.0.0.0:13030/rdf002/"

curl -L -X POST "http://0.0.0.0:13030/rdf002/" -H "Content-Type: application/sparql-update" -H "Accept: application/sparql-results+json" --data-binary "@delete.sparql"
