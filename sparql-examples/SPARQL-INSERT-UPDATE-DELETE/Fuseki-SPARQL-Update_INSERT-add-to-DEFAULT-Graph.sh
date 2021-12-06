#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:13030/try-insert-delete/" -H "Content-Type: application/sparql-update" -H "Accept: application/sparql-results+json" --data-raw "PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX ns: <http://example.org/ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

DELETE DATA
{ GRAPH <http://example/bookStore> { <http://example/book1>  dc:title  \"Fundamentals of Compiler Desing\" } } ;

PREFIX dc: <http://purl.org/dc/elements/1.1/>
INSERT DATA
{ GRAPH <http://example/bookStore> { <http://example/book1>  dc:title  \"Fundamentals of Compiler Design, 2nd Edition\" } }"
