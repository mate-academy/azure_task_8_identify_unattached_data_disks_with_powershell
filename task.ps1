$unattachedDisks = Get-AzDisk | Where-Object { $null -eq $_.ManagedBy }

$unattachedDisks | ConvertTo-Json | Out-File -FilePath "result.json"