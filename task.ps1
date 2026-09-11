$rgName = "mate-azure-task-5"

$unattachedDisks = Get-AzDisk -ResourceGroupName $rgName |
    Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath "$PSScriptRoot/result.json" -Encoding utf8
