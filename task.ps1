$resourceGroupName = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object {
    $_.DiskState -eq "Unattached" -or $_.ManagedBy -eq $null
}

$result = $unattachedDisks | Select-Object `
    Name, `
    Location, `
    DiskSizeGB, `
    Sku, `
    DiskState, `
    ManagedBy

$result | ConvertTo-Json -Depth 5 | Set-Content "result.json"