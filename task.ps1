$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object { $_.ManagedBy -eq $null }
$disks | ConvertTo-Json | Out-File -FilePath "result.json"
