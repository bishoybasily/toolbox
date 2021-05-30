FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install mysql-client redis-tools -yq

LABEL maintainer="bishoybasily@gmail.com"
