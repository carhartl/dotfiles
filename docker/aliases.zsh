alias d="docker \$*"
alias dc="docker-compose \$*"
# stop containers
alias ds="docker stop \$(docker ps -q -f status=exited)"
# remove stopped containers
alias dgcc="docker rm -v \$(docker ps -q -f status=exited)"
# remove dangling images
alias dgci="docker rmi \$(docker images -q -f dangling=true)"
