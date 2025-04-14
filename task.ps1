$resourceGroupName = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $resourceGroupName
$unattachedDisks = $disks | Where-Object { $_.DiskState -eq 'Unattached' }
$unattachedDisksJson = ConvertTo-Json -InputObject $unattachedDisks
$unattachedDisksJson | Set-Content -Path "./result.json"
