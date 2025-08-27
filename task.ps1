$resourceGroup = "mate-azure-task-5"

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDataDisks = $allDisks | Where-Object {
    -not $_.ManagedBy -and
    $null -eq $_.OsType
}

$jsonOutput = @($unattachedDataDisks) | ConvertTo-Json -Depth 5

Set-Content -Path ".\result.json" -Value $jsonOutput

Write-Host "result.json"
