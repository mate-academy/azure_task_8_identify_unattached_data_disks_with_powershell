$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json | Set-Content "$PWD/result.json"
