$resourceGroupName = "mate-azure-task-5"
$resultPath = Join-Path $PSScriptRoot "result.json"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName
$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $resultPath -Force
