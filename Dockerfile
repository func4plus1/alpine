FROM alpine:3.12

ARG WORKSPACE=/root 

RUN apk add \
	git \
	wget \
	vim \
	zsh

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 


RUN git config --global user.name "John Doe"
RUN git config --global user.email johndoe@example.com

RUN apk add --update nodejs npm
RUN apk --no-cache --update add build-base

WORKDIR $WORKSPACE
COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

RUN vim +PlugInstall +qall 

