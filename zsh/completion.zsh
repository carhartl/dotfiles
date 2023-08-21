# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Use cache for completion, some functions are slow
zstyle ':completion:*' use-cache on

compdef g=git
compdef d=docker
compdef dots=git
# kubectl setup is required when not installing kubectl via brew
source <(kubectl completion zsh)
compdef k=kubectl
