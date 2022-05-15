FROM ubuntu:22.04

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
    apt-transport-https \
    lsb-release \
    ca-certificates \
    openjdk-11-jdk \
    maven \
    git \
    -yq

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && apt-get install gnupg -yq
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && apt-get update && apt-get install mongodb-database-tools -yq
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-sdk -y
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list && apt-get update && apt-get install azure-cli

LABEL maintainer="bishoybasily@gmail.com"
