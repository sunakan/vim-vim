ARG DOCKER_GO_TAG
FROM golang:${DOCKER_GO_TAG}
ENV LANG C.UTF-8

RUN apt update \
  && apt install -y \
    vim \
    tree \
    colordiff \
    make

ARG USER_NAME=gorilla
RUN groupadd --system --gid 1000 ${USER_NAME} \
  && useradd --system --uid 1000 --create-home --gid ${USER_NAME} ${USER_NAME}

WORKDIR /home/${USER_NAME}
RUN curl -fLo /home/${USER_NAME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN git clone https://github.com/fatih/vim-go.git /home/${USER_NAME}/.vim/plugged/vim-go
COPY ./.vimrc ./
RUN vim -c PlugInstall -c q -c q
RUN vim -c GoInstallBinaries -c q

RUN chown --recursive ${USER_NAME}:${USER_NAME} /home/${USER_NAME}

USER ${USER_NAME}
