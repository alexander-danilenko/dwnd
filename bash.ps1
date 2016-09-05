# This script initiates interactive bash session with needed container.

param (
  [string]$container = "cli"
)
Write-Host -ForegroundColor Yellow -Object "Opening interactive terminal session with $container container..."
docker exec -it $(docker-compose ps -q $container) bash
