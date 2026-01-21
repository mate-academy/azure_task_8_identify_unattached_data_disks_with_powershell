# Write your code here
$list = Get-AzDisk -ResourceGroupName mate-azure-task-5 | Where-Object {$_.DiskState -eq 'Unattached'}
$list | ConvertTo-Json | Out-File -Path "result.json"