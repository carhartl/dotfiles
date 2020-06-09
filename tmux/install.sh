#!/bin/sh
#
# Install tmux plugin manager when necessary
if test ! -d ~/.tmux/plugins/tpm
then
  echo "  Installing Tmux Plugin Manager for you."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

exit 0
