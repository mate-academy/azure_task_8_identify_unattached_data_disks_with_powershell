$diskfind = Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object { $_.DiskState -eq "Unattached" } | ConvertTo-Json -Depth 100 | Out-File .\result.json
