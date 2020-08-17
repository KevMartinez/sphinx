FROM ubuntu:bionic

#Install parrot-sphinx
RUN echo "deb http://plf.parrot.com/sphinx/binary `lsb_release -cs`/" | tee /etc/apt/sources.list.d/sphinx.list > /dev/null &&\
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 508B1AE5 &&\
    apt update &&\
    apt install -y parrot-sphinx

#Nimbix image common
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install curl && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash -s -- --setup-nimbix-desktop

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22

# for standalone use
EXPOSE 5901
EXPOSE 443
