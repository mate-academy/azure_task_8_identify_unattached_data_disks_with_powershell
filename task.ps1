$resourceGroupName = "mate-azure-task-5"

$result = Get-AzDisk -ResourceGroupName $resourceGroupName |
    Where-Object { $_.DiskState -eq "Unattached" } |
    Select-Object Name, ResourceGroupName, Location, DiskSizeGB, DiskState, ManagedBy

$result | ConvertTo-Json -Depth 5 | Set-Content -Path "$PSScriptRoot\result.json"
