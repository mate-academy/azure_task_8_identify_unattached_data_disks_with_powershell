$resourceGroup = "mate-azure-task-5"

$resultFile = Join-Path $PSScriptRoot "result.json"

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = @(
    $allDisks |
    Where-Object { -not $_.ManagedBy }
)

$unattachedDisks |
    ConvertTo-Json -Depth 4 |
    Set-Content -Path $resultFile -Encoding UTF8
