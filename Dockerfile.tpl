FROM ubuntu:16.04
MAINTAINER rcmova@gmail.com

ENV BUILD_TIMESTAMP 201704051337
ENV LOCALE en_US.UTF-8

ADD assets/etc/apt /assets/etc/apt

RUN /bin/bash -c 'ln -fs /assets/etc/apt/sources.list /etc/apt/sources.list' && /bin/bash -c 'ln -fs /assets/etc/apt/apt.conf.d/99recommends /etc/apt/apt.conf.d/99recommends'

# depending images' Dockerfile placeholders
_01_jpetazzo_dind_PLACEHOLDER_

_02_openjdk_8_jdk_PLACEHOLDER__

_03_jenkinsci_docker_PLACEHOLDER_

# install basic utils
RUN apt-get update -qq && \
    # base depends
    DEBIAN_FRONTEND=noninteractive apt-get install -y locales net-tools iputils-ping iproute2 sysstat iotop tcpdump tcpick bwm-ng tree strace screen rsync inotify-tools socat wget curl \
    openssh-server openssh-client build-essential automake make autoconf libpcre3-dev software-properties-common supervisor sudo git vim emacs python-minimal fontconfig ssmtp mailutils \
    bash-completion less

RUN locale-gen $LOCALE && update-locale LANG=$LOCALE

# installl docker-compose 
ENV DOCKER_COMPOSE_VERSION="1.12.0"
RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# allow jenkins to talk to docker daemon
RUN adduser jenkins docker

ADD assets/ /assets

VOLUME ["/var/log/supervisor"]
ENTRYPOINT ["/assets/bin/entrypoint"]
