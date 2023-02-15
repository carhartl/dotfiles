#!/bin/sh
#
# Install shell completion for Docker commands
# https://docs.docker.com/desktop/faqs/macfaqs/#how-do-i-install-shell-completion
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /opt/homebrew/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion /opt/homebrew/share/zsh/site-functions/_docker-compose
