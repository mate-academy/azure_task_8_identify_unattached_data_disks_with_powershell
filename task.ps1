$resultFile = "./result.json"

$unattachedDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-5" |
    Where-Object { $_.DiskState -eq "Unattached"}

$unattachedDisks |
    ConvertTo-Json -Depth 10 |
    Out-File -FilePath $resultFile -Encoding utf8