# This script prints status of all or needed containers described in docker-compose.yml

param (
  [string]$container = ""
)

docker-compose ps $container
