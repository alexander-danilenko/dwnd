param (
  [string]$container = "cli"
)

docker exec -it $(docker-compose ps -q $container) bash