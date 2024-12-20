$resourceGroupName = "mate-azure-task-5"
$resultFilePath = "$PSScriptRoot\result.json"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName
$unattachedDisks = $disks | Where-Object { $_.DiskState -eq 'Unattached' }
$unattachedDisks | ConvertTo-Json -Depth 3 | Set-Content -Path $resultFilePath
