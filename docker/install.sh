#!/bin/sh
#
# Activate completion for Docker commands
etc=/Applications/Docker.app/Contents/Resources/etc
target=~/.zsh/completion
mkdir -p $target
ln -sf $etc/docker.zsh-completion $target/_docker
ln -sf $etc/docker-compose.zsh-completion $target/_docker-compose
