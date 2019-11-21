alias d="docker \$*"
alias dc="docker-compose \$*"
# Stop containers
alias ds="docker stop \$(docker ps -a -q)"
# Remove stopped containers
alias dgcc="docker rm -v \$(docker ps -a -q -f status=exited)"
# Remove dangling images
alias dgci="docker image prune"
