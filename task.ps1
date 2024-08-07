# Write your code here
$resourceGroupName = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object { -not $_.ManagedBy }

$result = $unattachedDisks | Select-Object -Property Id, Name, Location, DiskSizeGB, DiskState | ConvertTo-Json

$result | Set-Content -Path ".\result.json"
