$disk = Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object { $_.DiskState -eq "Unattached"}

$disk | ConvertTo-Json | Out-File "./result.json"