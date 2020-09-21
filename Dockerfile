FROM debian:buster-slim

RUN apt-get update --assume-yes \
  && apt-get install --assume-yes \
    vim \
    make \
    gcc \
    openssl \
    git \
    curl \
    tree
