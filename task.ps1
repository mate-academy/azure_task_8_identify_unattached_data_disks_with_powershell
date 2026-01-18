$unattachedDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-2" |
    Where-Object { $_.DiskState -eq "Unattached" -or $_.ManagedBy -eq $null }

$unattachedDisks | ConvertTo-Json | Out-File -FilePath "result.json" -Encoding utf8