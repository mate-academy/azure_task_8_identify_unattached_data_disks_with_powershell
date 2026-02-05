$resourceGroupName = "mate-azure-task-5"
$resultFile = "result.json"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object {
    $_.DiskState -eq "Unattached" -or -not $_.ManagedBy
}

$result = $unattachedDisks | Select-Object `
    Name,
    Location,
    DiskSizeGB,
    Sku,
    DiskState,
    ManagedBy

$result | ConvertTo-Json -Depth 5 | Set-Content $resultFile