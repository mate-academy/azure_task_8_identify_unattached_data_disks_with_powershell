$resourceGroup = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = $disks | Where-Object {
    $_.ManagedBy -eq $null -and $_.DiskState -eq "Unattached"
}

$resultPath = Join-Path $PSScriptRoot "result.json"

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $resultPath