export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--style=minimal"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--layout=reverse --height=70% \
--preview='bat --color=always --style=plain --line-range=:500 {}' --preview-window=right:60% \
--bind '?:toggle-preview,ctrl-y:execute-silent(echo {+} | pbcopy),enter:execute(zed {+})'"
