FROM ubuntu:24.04

RUN apt update && apt install -y apt-transport-https \
	ca-certificates curl gnupg lsb-release \
        unzip zstd


COPY ./aws /build/aws
WORKDIR /build/aws
RUN /build/aws/install-aws-cli.sh


COPY ./azure /build/azure
WORKDIR /build/azure
RUN /build/azure/install-azure-cli.sh


WORKDIR /

RUN apt install -y postgresql-client-16

RUN apt install -y openssh-server

