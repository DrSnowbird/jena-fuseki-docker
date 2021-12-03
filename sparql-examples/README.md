# SPARQL Examples using CURL

# Ref: 
* https://wiki.lyrasis.org/pages/viewpage.action?pageId=59607334#TheSPARQLUpdateAPI-Insertexample
 
update=INSERT DATA {
   GRAPH <http://vitro.mannlib.cornell.edu/default/vitro-kb-2> {
      <http://test.domain/ns#book1>
          <http://purl.org/dc/elements/1.1/title>
          "Fundamentals of Compiler Design" .
    }
}
