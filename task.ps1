$resource_group = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $resource_group | Where-Object {$_.DiskState -eq "Unattached"}
$disks | ConvertTo-Json -Depth 100 | Out-File -Path ./result.json -Encoding utf8