# Write your code here
$allDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"
$unattachedDisks = $allDisks | Where-Object { $_.DiskState -eq "unattached" }
$unattachedDisks | ConvertTo-Json | Out-File result.json