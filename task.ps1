$resourceGroup = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = $disks | Where-Object {
    $_.DiskState -eq "Unattached" -or !$_.ManagedBy
}

$unattachedDisks | ConvertTo-Json -Depth 5 | Set-Content -Path "./result.json"