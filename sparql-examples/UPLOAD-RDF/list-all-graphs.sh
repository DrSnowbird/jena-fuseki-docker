#!/bin/bash -x

curl -L -X GET "http://0.0.0.0:13030/rdf001/sparql?query=select+%3Fg+(count(*)+as+%3Fcount)+%7Bgraph+%3Fg+%7B%3Fs+%3Fp+%3Fo%7D%7D+group+by+%3Fg" -H "Accept: application/sparql-results+json"

# --- output will like this: ---
# { "head": {
#     "vars": [ "g" , "count" ]
#   } ,
#   "results": {
#     "bindings": [
#       {
#         "g": { "type": "uri" , "value": "http://www.example.org/exampleDocument#monicaGraph" } ,
#         "count": { "type": "literal" , "datatype": "http://www.w3.org/2001/XMLSchema#integer" , "value": "6" }
#       }
#     ]
#   }
# }
# 
