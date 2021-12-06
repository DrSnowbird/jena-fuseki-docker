#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:13030/try-insert-delete/" -H "Content-Type: application/sparql-update" -H "Accept: application/sparql-results+json" --data-raw "# Remove all triples from the graph named with the IRI denoted by IRIref.
DELETE {
    GRAPH <http://example/bookStore> {
        ?s ?p ?o
    }
}
WHERE {
    GRAPH <http://example/bookStore> {
        ?s ?p ?o
    }
}
"
