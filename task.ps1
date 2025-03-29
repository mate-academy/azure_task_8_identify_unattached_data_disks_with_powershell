$resourceGroupName = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $resourceGroupName
$unattachedDisks = $disks | Where-Object {$_.ManagedBy -eq $null}
$unattachedDisksJson = $unattachedDisks | Select-Object Name, Location, DiskState, ManagedBy | ConvertTo-Json -Depth 3
$resultPath = ".\result.json"
$unattachedDisksJson | Out-File -FilePath $resultPath -Encoding UTF8