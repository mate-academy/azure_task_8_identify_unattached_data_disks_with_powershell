$resourceGroup = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 10 | Set-Content (Join-Path $PSScriptRoot "result.json")
