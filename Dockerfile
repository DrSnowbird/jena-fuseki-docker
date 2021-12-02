ARG BASE=${BASE:-openkbs/java11-nonroot-docker}
FROM ${BASE}

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## ---- Disclosure and Credits: ---- ####
# Portions of the code are from Stain's Fuseki github
MAINTAINER Stian Soiland-Reyes <stain@apache.org>

USER 0

##################################
#### ---- Tools: setup:  ---- ####
##################################
ENV LANG C.UTF-8
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
       bash curl ca-certificates findutils coreutils gettext pwgen; \
    apt-get autoremove; \
    rm -rf /var/lib/apt/lists/*

#    bash curl ca-certificates findutils coreutils gettext pwgen procps tini ; \
RUN echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf

USER ${USER:-developer}
WORKDIR ${HOME:-/home/developer}

#########################
#### ---- App:  ---- ####
#########################
ENV FUSEKI_VERSION=${FUSEKI_VERSION:-4.2.0}
# No need for https due to sha512 checksums below
ENV ASF_MIRROR=${ASF_MIRROR:-http://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=}
#### ---- Download: setup ---- ####
# https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-4.2.0.tar.gz
ENV DOWNLAD_URL=${DOWNLAD_URL:-https://dlcdn.apache.org/jena/binaries}
ENV TGZ_OBJECT=apache-jena-fuseki-${FUSEKI_VERSION}.tar.gz

## -- Config and data -- ##
ENV FUSEKI_BASE=${HOME}/fuseki

## -- Installation folder -- ##
ENV FUSEKI_HOME=${HOME}/jena-fuseki

## -- Download -- #
RUN echo ">>> ${DOWNLAD_URL}/${TGZ_OBJECT}" && curl -sS -o fuseki.tar.gz -L  ${DOWNLAD_URL}/${TGZ_OBJECT} && \
    (ls -al fuseki.tar.gz && tar -xvf fuseki.tar.gz) && \
    mv apache-jena-fuseki* ${FUSEKI_HOME} && \
    chown -R $USER:$USER ${FUSEKI_HOME} && \
    rm fuseki.tar.gz* && \
    cd ${FUSEKI_HOME} && rm -rf fuseki.war && chmod 755 fuseki-server

# -- Test the install by testing it's ping resource. 20s sleep because Docker Hub.
RUN  ${FUSEKI_HOME}/fuseki-server & \
     sleep 10 && \
     curl -sS --fail 'http://localhost:3030/$/ping' 
# No need to kill Fuseki as our shell will exit after curl

# As "localhost" is often inaccessible within Docker container,
# we'll enable basic-auth with a random admin password
# (which we'll generate on start-up)
COPY --chown=${USER}:${USER} app/docker-entrypoint.sh /
COPY --chown=${USER}:${USER} app/shiro.ini ${FUSEKI_HOME}/shiro.ini
COPY --chown=${USER}:${USER} app/load.sh ${FUSEKI_HOME}/
COPY --chown=${USER}:${USER} app/tdbloader ${FUSEKI_HOME}/
COPY --chown=${USER}:${USER} app/tdbloader2 ${FUSEKI_HOME}/
RUN sudo chmod +x /docker-entrypoint.sh ${FUSEKI_HOME}/load.sh ${FUSEKI_HOME}/tdbloader ${FUSEKI_HOME}/tdbloader2

#VOLUME /staging

USER ${USER}
# Where we start our server from
WORKDIR ${FUSEKI_HOME}

# Make sure we start with empty /fuseki
#RUN rm -rf ${FUSEKI_BASE} && mkdir -p ${FUSEKI_BASE}
#VOLUME ${FUSEKI_BASE}

EXPOSE 3030

#ENTRYPOINT ["/docker-entrypoint.sh"]
#COPY --chown=${USER}:${USER} app/fuseki_config.ttl {FUSEKI_HOME}/
#CMD ["bash", "-c", "${FUSEKI_HOME}/fuseki-server"]

#ENTRYPOINT ["/usr/bin/tini", "--", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
RUN sudo chmod +x /docker-entrypoint.sh ${FUSEKI_HOME}/load.sh ${FUSEKI_HOME}/tdbloader ${FUSEKI_HOME}/tdbloader2
#CMD ["/home/developer/jena-fuseki/fuseki-server --config=fuseki_config.ttl"]
CMD ["/home/developer/jena-fuseki/fuseki-server"]
#CMD ["bash"]
