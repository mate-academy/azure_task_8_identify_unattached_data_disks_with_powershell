$disks = Get-AzDisk

$unattachedDisks = $disks | Where-Object {
    $null -eq $_.ManagedBy
}

$unattachedDisks |
    Select-Object Name, ResourceGroupName, Location, DiskSizeGB, DiskState |
    ConvertTo-Json |
    Set-Content -Path ".\result.json"
