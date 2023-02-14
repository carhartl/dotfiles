#!/bin/sh
#
# Activate completion for Docker commands
# https://docs.docker.com/desktop/faqs/macfaqs/#how-do-i-install-shell-completion
etc=/Applications/Docker.app/Contents/Resources/etc
mkdir -p $HOME/.zsh
mkdir -p $HOME/.zsh/completion
ln -sf $etc/docker.zsh-completion $HOME/.zsh/completion/_docker
ln -sf $etc/docker-compose.zsh-completion $HOME/.zsh/completion/_docker-compose
