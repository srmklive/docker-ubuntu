FROM ubuntu:latest

LABEL maintainer="Raza Mehdi<srmk@outlook.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install apt-utils \ 
  && apt-get -y install curl nano zip unzip git openssl sqlite3 build-essential software-properties-common \
  && apt-get -y upgrade
  
RUN apt-get -y install cron supervisor gnupg tzdata \
  && echo "UTC" >> /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get -y upgrade

RUN apt-get install -y \
    python3.7-dev \
    python3.7-venv \
    python3-pip \
    libmagickwand-dev \
    supervisor \
    graphviz \
    libgraphviz-dev \
    pkg-config \
    virtualenv \
    libcurl4-openssl-dev \
    libssl-dev \
    ffmpeg

RUN mkdir /code
WORKDIR /python_packages

RUN sysctl vm.overcommit_memory=1

ADD requirements.txt /python_packages
RUN pip3 install -r requirements.txt

RUN apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
