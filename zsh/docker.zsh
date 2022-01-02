alias dc="docker-compose"
alias ds="docker stop \$(docker ps -a -q)"

function d {
  if [[ $# > 0 ]]; then
    docker "$@"
  else
    docker stats --no-stream
  fi
}
