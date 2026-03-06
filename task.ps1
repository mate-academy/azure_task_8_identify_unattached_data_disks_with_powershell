$resourceGroupName = "mate-azure-task-5"
$outputPath = "$PSScriptRoot/result.json"

$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName |
    Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $outputPath -Encoding utf8
