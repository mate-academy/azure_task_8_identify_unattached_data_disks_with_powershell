# Write your code here

$disk_objects = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'

$disk_objects | Where-Object {
    $_.DiskState -eq "Unattached" -and $_.ManagedBy -eq $null
} | ConvertTo-Json | Out-File ./result.json

