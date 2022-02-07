#!/bin/bash -x

curl 'http://0.0.0.0:9999/blazegraph/namespace/kb/sparql' \
  -H 'Accept: application/sparql-results+json' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  --data-raw 'query=PREFIX+d3f%3A+%3Chttp%3A%2F%2Fd3fend.mitre.org%2Fontologies%2Fd3fend.owl%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0ASELECT+*+%0D%0A%0D%0A++%7B%0D%0A++++GRAPH+%3Chttp%3A%2F%2Fd3fend.mitre.org%2Fontologies%3E+%7B%0D%0A++++%3Fs+%3Fp+%3Fo%0D%0A+++++++%7D%0D%0A++%7D'
