# This script executes commands in needed container's bash.

param (
  [string]$command = "status",
  [string]$docroot = "/var/www/docroot",
  [string]$site = "default",
  [string]$cli_container = "cli"
)

Write-Host -ForegroundColor Cyan   -Object "Executing",
Write-Host -ForegroundColor Yellow -Object "$drush $command" 
Write-Host -ForegroundColor Cyan   -Object "in $docroot/sites/$site folder of $cli_container container..."
docker exec -it $(docker-compose ps -q $cli_container) bash -c "cd $docroot && cd sites/$site && drush $command"
