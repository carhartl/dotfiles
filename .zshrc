fpath=($HOME/zsh/functions $HOME/.docker/completions $fpath)
autoload -Uz $HOME/zsh/functions/*(.:t)

# Interactive environment configs
setopt NULLGLOB EXTENDEDGLOB

typeset -U interactive_files
interactive_files=($HOME/zsh/*.zsh)
for file in ${interactive_files}; do
	source "$file"
done

# Initialize autocomplete here, otherwise functions won't be loaded
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
compinit

unset interactive_files
unsetopt NULLGLOB EXTENDEDGLOB

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
zstyle ':prompt:pure:git:dirty' detailed yes
zstyle ':prompt:pure:git:stash' show yes
autoload -U promptinit
promptinit
prompt pure

if [[ ! -d ~/.zsh-defer ]]; then
	git clone --quiet --depth=1 https://github.com/romkatv/zsh-defer.git ~/.zsh-defer
fi
source ~/.zsh-defer/zsh-defer.plugin.zsh
zsh-defer source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
zsh-defer source /opt/homebrew/etc/profile.d/z.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
zsh-defer eval "$(fzf --zsh)"
zsh-defer eval "$(mise activate zsh)"
zsh-defer -c '[ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh'
