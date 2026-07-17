# Write your code here

$disks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5' | Where-Object DiskState -eq 'Unattached'

$disks | ConvertTo-Json | Out-File -FilePath .\result.json

