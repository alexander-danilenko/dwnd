# This script stops all containers described in docker-compose.yml

Write-Host -ForegroundColor Green -Object "Stopping all containers..."
docker-compose stop
