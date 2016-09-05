# This script pulls and runs all containers described in docker-compose.yml

param (
  [string]$cli_container = "cli"
)

Write-Host -ForegroundColor Green -Object "Starting all containers..."

docker-compose up -d

Write-Host -ForegroundColor Green -Object "Reseting permissions on /var/www in $cli_container container..."
docker exec -u root $(docker-compose ps -q $cli_container) bash -c "chown -R docker:users /var/www"
