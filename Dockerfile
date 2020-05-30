FROM ubuntu:bionic

LABEL maintainer="Raza Mehdi<srmk@outlook.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install apt-utils \ 
  && apt-get -y install wget curl nano zip unzip git openssl sqlite3 build-essential software-properties-common \
  && apt-get -y upgrade \
  && apt-get -y dist-upgrade

RUN apt-get install -y python3.7-dev python3.7-venv python3-pip libmagickwand-dev libssl-dev ffmpeg \ 
    cron supervisor gnupg tzdata graphviz libgraphviz-dev pkg-config virtualenv libcurl4-openssl-dev
  
RUN echo "UTC" >> /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get -y upgrade

RUN sysctl vm.overcommit_memory=1

RUN apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
