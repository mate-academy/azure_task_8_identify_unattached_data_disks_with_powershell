$disk = Get-AzDisk -ResourceGroupName "mate-azure-task-5"
$unattacheddisk = $disk | Where-Object { $null -eq $_.ManagedBy } | ConvertTo-Json | Out-File ./result.json
