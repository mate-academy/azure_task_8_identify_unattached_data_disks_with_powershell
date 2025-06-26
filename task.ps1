# Write your code here
$resourceGroup = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = $disks | Where-Object { -not $_.ManagedBy }

$unattachedDisks | ConvertTo-Json -Depth 4 | Set-Content -Path "result.json"