FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&  \
    apt-get install mysql-client \
                postgresql-client \
                redis-tools \
                unzip \
                nano \
                wget \
                curl \
                zlib1g-dev \
                jq \
                rsync \
                awscli \
                python3-pip \
                build-essential \
                at \
                apt-utils \
    -yq

RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
RUN apt-get install gnupg
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update && apt-get install mongodb-database-tools

LABEL maintainer="bishoybasily@gmail.com"
