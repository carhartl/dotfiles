# Variables

CORRECT_IGNORE_FILE='.*'
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTORY_IGNORE="(ls|l|pwd|exit|clear|history|top|htop|rm|cp|mv|less|more|vim|zed|which|man|df|du|free|ps|kill|hh)"
HISTORY_SUBSTRING_SEARCH_FUZZY=1
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
HISTSIZE=100000
SAVEHIST=100000

# Options...
# See http://zsh.sourceforge.net/Doc/Release/Options.html

# Changing Directories
setopt AUTO_CD

# Completion
setopt ALWAYS_TO_END    # Move cursor to the end of a completed word
setopt AUTO_LIST        # Automatically list choices on ambiguous completion
setopt AUTO_MENU        # Show completion menu on a successive tab press
setopt AUTO_PARAM_SLASH # If completed parameter is a directory, add a trailing slash
setopt COMPLETE_IN_WORD # Complete from both ends of a word
setopt NO_FLOW_CONTROL  # Disable start/stop characters in shell editor
setopt NO_MENU_COMPLETE # Do not autoselect the first completion entry
setopt NO_LIST_BEEP     # Do not beep for ambiguous completions
setopt PATH_DIRS        # Perform path search even on command names with slashes

# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
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

# Key bindings

bindkey -e

bindkey '^[[3~' delete-char

# Allow editing long commands in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

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
bindkey '^x^a' _after-first-word

# Do history expansion on space
bindkey ' ' magic-space
