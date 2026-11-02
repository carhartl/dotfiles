function pet-select() {
	BUFFER=$(pet search --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N pet-select
[[ -t 0 ]] && stty -ixon
bindkey '^s' pet-select
