Get-AzDisk | Where-Object { $_.ResourceGroupName -eq "MATE-AZURE-TASK-5" -and $_.DiskState -eq "Unattached" } | ConvertTo-Json | Out-File "$PWD\result.json"
