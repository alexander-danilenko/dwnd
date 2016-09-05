# This script executes commands in needed container's bash.

param (
  [string]$command = "ls -la",
  [string]$container = "cli"
)
Write-Host -ForegroundColor Cyan -Object "Executing"
Write-Host -ForegroundColor Yellow -Object $command 
Write-Host -ForegroundColor Cyan -Object "in $container container..."
docker exec -it $(docker-compose ps -q $container) bash -c $command
