#!/bin/sh

mkdir -p ~/.tmux
cd ~/.tmux || exit
git clone https://github.com/carhartl/kube-tmux.git

# Install TPM plugins (would need to execute prefix + I once)
~/.tmux/plugins/tpm/bin/install_plugins