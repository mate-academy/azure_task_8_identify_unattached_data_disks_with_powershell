$resourceGroupName = "mate-azure-task-2"
$vmUnattachedDataDisk = Get-AzDisk -ResourceGroupName $resourceGroupName | Where-Object {$_.DiskState -eq 'Unattached' -or [string]::IsNullOrEmpty($_.ManagedBy)}
$vmUnattachedDataDisk | ConvertTo-Json | Out-File -Path ./result.json