export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($DOTFILES/zsh/functions $fpath)
autoload -U $DOTFILES/zsh/functions/*(:t)


# Variables

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


# Options...
# See http://zsh.sourceforge.net/Doc/Release/Options.html

# Changing Directories
setopt AUTO_CD

# Completion
setopt COMPLETE_IN_WORD
setopt NO_LIST_BEEP

# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

# Input/Output
setopt CORRECT
setopt CORRECT_ALL
setopt IGNORE_EOF

# Job Control
setopt NO_BG_NICE
setopt NO_HUP

# Prompting
setopt PROMPT_SUBST

# Scripts and Functions
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS


# Do menu-driven completion
zstyle ':completion:*' menu select


# Key bindings

bindkey -e

bindkey "^[[3~" delete-char

# Allow editing long commands in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^xe" edit-command-line
bindkey "^x^e" edit-command-line

# ctrl-g => git status on blank screen, whithout adding to history
_git-status() {
   clear
   git status
   zle redisplay
}
zle -N _git-status
bindkey '^g' _git-status

# Move to where the arguments belong
_after-first-word() {
  zle beginning-of-line
  zle forward-word
}
zle -N _after-first-word
bindkey "^x^a" _after-first-word

# Bind history to up down keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Do history expansion on space
bindkey " " magic-space
