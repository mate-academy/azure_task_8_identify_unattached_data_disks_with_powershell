$unattachedDisks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5' |
    Where-Object { $_.DiskState -eq 'Unattached' }

$unattachedDisks | ConvertTo-Json -Depth 5 | Set-Content -Path "./result.json"
