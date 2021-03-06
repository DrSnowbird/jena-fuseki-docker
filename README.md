# Apache Fuseki TDB (Tuple DB) + Java 11 OpenJDK with no root access 
* A RDF Fuseki TDB w/ Java 11 base Container with `no root access` (except using `sudo ...` and you can remove it using `sudo apt-get remove sudo` to protect your Container). 
```
If [ you are looking for such a common requirement as a base Container ]:
   Then [ this one may be for you ]
```

# (`NEW`) CVE Log4J Vulability
* Dockerfile added built-in system environment variable
```
ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true
```

# Credits:
* This project leveraged many what Stain's stain/jena-docker GIT project though it's not directly forked.

# Components:
* OpenJDK Java 11 base image + Non-root User (/home/developer)
* [Apache Jena](https://jena.apache.org/index.html) - Triple Store TDB/TDB2, SPARQL/Fuseki.
* Maven + Gradle
* No root setup: using /home/developer 
  * It has sudo for dev phase usage. You can "sudo apt-get remove sudo" to finalize the product image.
  * Note, you should consult Docker security experts in how to secure your Container for your production use!)

# Build (do this first!)
```
./build.sh
```

# Run (recommended for easy-start)
```
./run.sh
```
To use docker-compose, 
```
docker-compose up
```
To access Web UI:
```
http://0.0.0.0:13030/
```

# Quick commands
* build.sh - build local image
* logs.sh - see logs of container
* run.sh - run the container
* shell.sh - shell into the container
* stop.sh - stop the container

# Issues
Often you might encounter error like no access permission.
* Most likely, the root cause is the mis-alignment of ownerships between host's 'fuseki' (root or <you>) and the folder mapping to /home/developer/fuseki.
* Makesure you first 'mkdir ./databases' with owner (1001:1001) before you run 'docker-compose up'

# Resources:
* [W3C SPARQL 1.1 Update - W3C Recommendation 21 March 2013](https://www.w3.org/TR/sparql11-update/)
* [Apache Jena Home](https://jena.apache.org/index.html)
* [Apache Jena TDB2 Command Line Tools](https://jena.apache.org/documentation/tdb2/tdb2_cmds.html)
* [Apache Jena Ontology API](https://jena.apache.org/documentation/ontology/)
* [Apache Jean Inference API](https://jena.apache.org/documentation/inference/index.html)
* [SPARQL 1.1 Query Language](https://www.w3.org/TR/sparql11-query/)
* [SPARQL 1.1 Graph Store HTTP Protocol](https://www.w3.org/TR/sparql11-http-rdf-update/)
* [HyperGraphQL Demo](https://www.hypergraphql.org/demo/)
* [GraphQL Schema & Service Generator](https://github.com/genesis-upc/Ontology2GraphQL)
* [DrSnowbird/rdf4j-docker, Apache Jena TDB/TDB2 RDF Server](https://github.com/DrSnowbird/rdf4j-docker)
* [DrSnowbird/blazegraph-docker, high-performance RDF Server](https://github.com/DrSnowbird/blazegraph-docker)
* [DrSnowbird/json2rdf-docker, converting JSON to RDF](https://github.com/DrSnowbird/json2rdf-docker)
* [DrSnowbird/visualRDF, Visualize RDF Graph](https://github.com/DrSnowbird/visualRDF)
* [DrSnowbird/SANSA-RDF](https://github.com/DrSnowbird/SANSA-RDF)

# Things to know about TDB/TDB2
* (per TDB document page - do not direct access TDB/TDB2 as multi-concurrent access/update since doing this might corrupt the database). Always use SPARQL HTTP REST API for Query and Update.
* (digested from the TDB/TDB2) A TDB dataset should only be directly accessed from a single JVM at a time otherwise data corruption may occur. From 1.1.0 onwards TDB includes automatic protection against multi-JVM usage which prevents this under most circumstances.

If you wish to share a TDB dataset between multiple applications please use our Fuseki component which provides a SPARQL server that can use TDB for persistent storage and provides the SPARQL protocols for query, update and REST update over HTTP.

# HTTP Contents Negotiation:
HTTP RDF Content negotiation should work from "http://schema.org/" and include all supported formats
* text/turtle (Turtle)
* application/n-quads (Quad)
* application/n-triples (Ntriples)
* application/ld+json (JSON-LD)
* application/xhtml+xml (RDFa)
