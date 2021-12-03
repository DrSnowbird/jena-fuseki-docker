curl -L -X POST "http://0.0.0.0:13030/rdf002/" -H "Content-Type: application/trig" -H "Accept: application/sparql-results+json" --data-raw "@prefix ex: <http://www.example.org/vocabulary#> .
@prefix : <http://www.example.org/exampleDocument#> .

:susanGraph { 
    :Susan a ex:Person ;
            ex:name \"Susan Johns\" ;
            ex:homepage <http://www.susanjohns.org> ;
            ex:email <mailto:susan@susanjohns.org> ;
            ex:hasSkill ex:Marketing ,
            ex:productSales . 
}"
