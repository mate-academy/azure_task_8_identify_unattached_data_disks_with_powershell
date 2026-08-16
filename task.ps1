$results = Get-AzDisk | Where-Object {$_.ResourceGroupName -eq 'MATE-AZURE-TASK-5'} | Where-Object {$_.DiskState -eq 'Unattached'}
$results | ConvertTo-Json | Out-File -Path "./result.json"