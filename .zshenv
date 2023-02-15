# Prefer US English and use UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export DOTFILES="$HOME"
export PATH="$DOTFILES/bin:/opt/homebrew/opt/curl/bin:$PATH"

export GPG_TTY=$(tty)

# Project folder that we can `c [tab]` to
export PROJECTS=~/Workspace

# Use vim
export EDITOR=vim

# Better ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
