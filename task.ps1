$resourceGroupName = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 5 | Out-File -FilePath "$PWD/result.json" -Force
