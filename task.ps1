$resourceGroup = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $resourceGroup

$unttachedDisk = $disks | Where-Object { $_.DiskState -eq 'Unattached' -or $_.ManagedBy -eq $null }

$json = $unttachedDisk | ConvertTo-Json

$json | Out-File -Path ./result.json -Encoding utf8