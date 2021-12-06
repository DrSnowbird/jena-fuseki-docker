#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:13030/try-insert-delete/" -H "Content-Type: application/sparql-update" -H "Accept: application/sparql-results+json" --data-raw "# Remove all triples from a specified graph.
CLEAR GRAPH <http://example/bookStore>"
