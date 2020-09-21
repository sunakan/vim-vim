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

# Color
RUN mkdir -p ~/.vim/colors/ \
  && curl --location --output ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

WORKDIR /root/

RUN apt-get install --assume-yes jq

RUN mkdir -p ~/.vim/pack/plugins/start/ \
  && git clone git://github.com/nathanaelkane/vim-indent-guides.git ~/.vim/pack/plugins/start/vim-indent-guides
ENV LANG C.UTF-8
