# Interactive environment configs
setopt NULLGLOB EXTENDEDGLOB

typeset -U interactive_files completion_files
interactive_files=($HOME/*/*.zsh~*/completion.zsh)
completion_files=($HOME/*/completion.zsh)

# Load interactive files (everything but the completion)
for file in ${interactive_files}; do
  source "$file"
done

# Initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# Load completion after autocomplete loads
for file in ${completion_files}; do
  source "$file"
done

unset interactive_files completion_files
unsetopt NULLGLOB EXTENDEDGLOB

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
# Include *after* all other configuration has been loaded so I can override
# certain options easily.
if [[ -a ~/.localrc ]]; then
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
zstyle ":prompt:pure:git:stash" show yes
autoload -U promptinit; promptinit
prompt pure

source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/opt/homebrew/etc/profile.d/z.sh"

# Order is important here, so that asdf's shims come before
# the executables provided by homebrew (so that the expected
# say version of node - configured via asdf - is in place and
# not the one from homebrew)!
eval "$(/opt/homebrew/bin/brew shellenv)"
source "/opt/homebrew/opt/asdf/libexec/asdf.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/klaus/.config/op/plugins.sh
