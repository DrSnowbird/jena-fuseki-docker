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
* When running inside coporate Cloud VMware VM, you might encounter the /home/developer/fuseki/databases file can not be written. This is due to your host user ID not 1000 and the container is running user ID 1000. You need to figure out the user ID issue by yourself. I can only help so far with this open source Fuseki TDB server. You might want to ask your network or IT adminstrator to help you solve this issle.
