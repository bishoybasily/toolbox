FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install gnupg unzip nano wget curl build-essential zlib1g-dev jq rsync awscli python3-pip build-essential docker.io mysql-client redis-tools -yq

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update && \
    apt-get install mongocli -yq

LABEL maintainer="bishoybasily@gmail.com"
