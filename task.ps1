Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object { $_.DiskState -eq "Unattached"} | ConvertTo-Json | Out-File -FilePath "result.json"
