$disks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$undisk = $disks | Where-Object {$_.DiskState -eq 'Unattached'}
$undisk | ConvertTo-Json | Out-File "./result.json"