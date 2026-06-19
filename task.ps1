# Write your code here
$UnattachedDisks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5' | Where-Object {$_.DiskState -eq 'Unattached'}
$UnattachedDisks | ConvertTo-Json | Out-File -FilePath './result.json' -Encoding utf8