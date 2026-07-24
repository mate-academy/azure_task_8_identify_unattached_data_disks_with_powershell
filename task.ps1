Get-AzDisk | Where-Object { $_.DiskState -eq "Unattached" -and $_.ResourceGroupName -eq "MATE-AZURE-TASK-5" } | ConvertTo-Json | Out-File -FilePath "result.json"

