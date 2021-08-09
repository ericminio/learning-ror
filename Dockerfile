FROM ruby:3.0.2-buster

RUN apt-get update && \
    apt-get install -y \
        build-essential libssl-dev curl git vim \
        sqlite

RUN echo "PS1='\n\[\e[32m\]\u \[\e[33m\]in \w\[\e[0m\] \n> '" >> ~/.bashrc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

ENV NVM_DIR=/root/.nvm
RUN . /root/.nvm/nvm.sh && \
    nvm install --lts && \
    npm install --global yarn

RUN gem install rails
