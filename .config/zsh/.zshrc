#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=${ZDOTDIR:-$HOME}/.zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Load zstyles used for configuration.
source ${ZDOTDIR:-$HOME}/.zstyles

# Load antidote plugins.
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# Source anything in .zshrc.d.
for _rc in ${ZDOTDIR:-$HOME}/.zshrc.d/*.zsh; do
	# Ignore tilde files.
	if [[ $_rc:t != '~'* ]]; then
		source "$_rc"
	fi
done
unset _rc

# Completions
autoload -Uz compinit

# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
local zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
local zcompdump_cache=($zcompdump(Nmh-20))
if (($#zcompdump_cache)); then
	# -C (skip function check) implies -i (skip security check).
	compinit -C
else
	compinit -i
	touch "$zcompdump" # Ensure timestamp updates to reset the cache timeout.
fi

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
# Include *after* all other configuration has been loaded so I can override
# certain options easily.
if [[ -e ~/.localrc ]]; then
	source ~/.localrc
fi

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Fun
autoload -U tetris
zle -N tetris
bindkey '^[T' tetris # Escape, Shift + T

# Make colors available for prompt
autoload colors && colors

# Setup prompt
autoload -Uz promptinit && promptinit && prompt pure

eval "$(/opt/homebrew/bin/brew shellenv)"

zsh-defer source /opt/homebrew/etc/profile.d/z.sh
zsh-defer eval "$(fzf --zsh)"
zsh-defer eval "$(mise activate zsh)"
zsh-defer -c '[ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh'
