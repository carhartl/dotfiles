function d {
  if [[ $# > 0 ]]; then
    docker "$@"
  else
    docker stats --no-stream
  fi
}
