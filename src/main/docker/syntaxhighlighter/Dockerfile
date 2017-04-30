FROM php:5.3
LABEL Description="This image is used to provide an environment for projects being build on PHP (5.3) and Java (OpenJDK 7)" Vendor="informaticum.de" Version="1.0"
MAINTAINER Stefan Gasterstädt <stefan@gasterstädt.de>

RUN apt-get update && \
    apt-get install -y openjdk-7-jre && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash bob
RUN mkdir -p /home/bob/workspace
RUN chown -R bob:bob /home/bob/

USER bob
WORKDIR /home/bob/workspace
