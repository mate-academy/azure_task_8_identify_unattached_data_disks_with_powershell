# Write your code here
$resourceGroupName = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json | Out-File -FilePath "./result.json"