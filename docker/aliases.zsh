alias dc="docker-compose"
# Stop containers
alias ds="docker stop \$(docker ps -a -q)"
# Remove stopped containers
alias dgcc="docker rm -v \$(docker ps -a -q -f status=exited)"
# Remove dangling images
alias dgci="docker image prune"
# Remove dangling volumes
alias dgcv="docker volume rm \$(docker volume ls -q -f dangling=true)"
