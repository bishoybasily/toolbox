FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install mysql-client postgresql-client redis-tools unzip nano wget curl build-essential zlib1g-dev jq rsync awscli python3-pip build-essential -yq

LABEL maintainer="bishoybasily@gmail.com"
