# Write your code here
$rgName = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $rgName

$unattachedDisks = $disks | Where-Object {$_.DiskState -eq "Unattached" }
$unattachedDisks | ConvertTo-Json | Out-File -FilePath "result.json"