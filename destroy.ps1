# This script destroys all containers described in docker-compose.yml with prompt.

param (
  [string]$arguments = "--remove-orphans"
)

Write-Host -ForegroundColor Cyan -Object "You are going to remove ALL CONTAINERS and their contents (like database tables, caches, manually installed packages, etc.)."
Write-Host -ForegroundColor Red -Object "This operation cannot be undone and may result to lost of data!"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    "Deletes all containers and their contents."

$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    "Keeps all as it is."

$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

$result = $host.ui.PromptForChoice($title, "Are you sure?", $options, 0) 

switch ($result){
  0 {
    docker-compose down $arguments
  }
}
