#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Prefer US English and use UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=true

export GPG_TTY=$(tty)

export EDITOR=zed

# Project folder that we can `c [tab]` to
export PROJECTS="$HOME/Workspace"

# Better ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
	$HOME/{,s}bin(N)
	$HOME/.local/{,s}bin(N)
	/opt/{homebrew,local}/{,s}bin(N)
	/usr/local/{,s}bin(N)
	$path
)
