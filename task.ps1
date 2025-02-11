$resourceGroup = "mate-azure-task-5"
$disks = Get-AzDisk -ResourceGroupName $resourceGroup
$unattachedDisks = @()

foreach ($disk in $disks) {
    if (-not $disk.ManagedBy) {
        $diskInfo = @{
            Name = $disk.Name
            DiskSizeGB = $disk.DiskSizeGB
            Location = $disk.Location
            SKU = $disk.Sku
            OsType = $disk.OsType
            CreationTime = $disk.TimeCreated
            DiskState = $disk.DiskState
        }

        $unattachedDisks += $diskInfo
    }
}

$unattachedDisks | ConvertTo-Json | Set-Content -Path ".\result.json"

Write-Host "Unattached disks information has been saved to 'result.json'"
