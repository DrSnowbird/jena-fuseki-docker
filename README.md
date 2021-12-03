# (Beta version - for developers only)

# Apache Fuseki TDB (Tuple DB) + Java 11 OpenJDK with no root access 
* A RDF Fuseki TDB w/ Java 11 base Container with `no root access` (except using `sudo ...` and you can remove it using `sudo apt-get remove sudo` to protect your Container). 
```
If [ you are looking for such a common requirement as a base Container ]:
   Then [ this one may be for you ]
```

# Credits:
* This project leverage many what Stain's stain/jena-docker GIT project.
* It is just not practical to fork from stain/jena-docker since there are a few structure changes.
* Though this project is not forked from stain/jena-docker, there are quite a few reuse from stain/jena-docker.

# Components:
* OpenJDK Java 11 base image
* jena-fuseki
* jena
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

# Quick commands
* build.sh - build local image
* logs.sh - see logs of container
* run.sh - run the container
* shell.sh - shell into the container
* stop.sh - stop the container

# Issues
* Most likely, the root cause is the mis-alignment of owner between host's 'fuseki' (root or <you>) and the folder mapping to /home/developer/fuseki.
* Makesure you first 'mkdir ./databases' before you run 'docker-compose up'

# Resources:
* [Apache Jena Home](https://jena.apache.org/index.html)
* [Apache Jena TDB2 Command Line Tools](https://jena.apache.org/documentation/tdb2/tdb2_cmds.html)
* [Apache Jena Ontology API](https://jena.apache.org/documentation/ontology/)
* [Apache Jean Inference API](https://jena.apache.org/documentation/inference/index.html)
* [SPARQL 1.1 Query Language](https://www.w3.org/TR/sparql11-query/)
* [SPARQL 1.1 Graph Store HTTP Protocol](https://www.w3.org/TR/sparql11-http-rdf-update/)
* [HyperGraphQL Demo](https://www.hypergraphql.org/demo/)
* [GraphQL Schema & Service Generator](https://github.com/genesis-upc/Ontology2GraphQL)

# Things to know about TDB/TDB2
* (per TDB document page - do not direct access TDB/TDB2 as multi-concurrent access/update since doing this might corrupt the database). Always use SPARQL HTTP REST API for Query and Update.
* (digested from the TDB/TDB2) A TDB dataset should only be directly accessed from a single JVM at a time otherwise data corruption may occur. From 1.1.0 onwards TDB includes automatic protection against multi-JVM usage which prevents this under most circumstances.

If you wish to share a TDB dataset between multiple applications please use our Fuseki component which provides a SPARQL server that can use TDB for persistent storage and provides the SPARQL protocols for query, update and REST update over HTTP.


