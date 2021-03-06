FROM ubuntu:latest

LABEL maintainer="Raza Mehdi<srmk@outlook.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install apt-utils \ 
  && apt-get -y upgrade \ 
  && apt-get -y install wget curl nano zip unzip git openssl sqlite3 build-essential software-properties-common cron supervisor gnupg tzdata 
  
RUN echo "UTC" >> /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get -y upgrade

RUN apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
