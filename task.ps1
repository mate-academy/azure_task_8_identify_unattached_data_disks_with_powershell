Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object { $_.DiskState -eq "Unattached" } | ConvertTo-Json -Depth 10 | Set-Content -Path ".\result.json"
