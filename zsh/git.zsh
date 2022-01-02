alias ga="git add"
alias gb="git switch -c"
alias gc="git commit"
alias gd="git difftool"
alias gdc="git difftool --cached"
alias gl="git l"
alias gp="git pull"
alias gs="git status --short"

function g {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    echo "Last commit: $(_time_since_last_commit) ago"
    git status --short --branch
  fi
}

function _time_since_last_commit() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
}
