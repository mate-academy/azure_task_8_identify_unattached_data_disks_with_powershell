# Write your code here
$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"
$unattached = $disks | Where-Object { $_.DiskState -eq "Unattached" }
$unattached | Select-Object Name, DiskSizeGB, DiskState | ConvertTo-Json | Set-Content -Path ./result.json
