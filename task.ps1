$resourceGroupName = "mate-azure-task-5"

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $allDisks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 10 | Set-Content -Path "$PSScriptRoot/result.json"
