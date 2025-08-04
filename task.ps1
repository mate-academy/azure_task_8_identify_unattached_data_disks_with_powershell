$resourceGroupName = "mate-azure-task-5"


$disks = Get-AzDisk -ResourceGroupName $resourceGroupName


$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" -or !$_.ManagedBy }


$results = @()

foreach ($disk in $unattachedDisks) {
    $results += [PSCustomObject]@{
        Name              = $disk.Name
        DiskSizeGB        = $disk.DiskSizeGB
        Location          = $disk.Location
        DiskState         = $disk.DiskState
        ResourceGroupName = $disk.ResourceGroupName
        Sku               = @{ Name = $disk.Sku.Name }
        ManagedBy         = if ($disk.ManagedBy) { $disk.ManagedBy } else { $null }
    }
}

$results | ConvertTo-Json -Depth 3 | Out-File -Encoding UTF8 -FilePath "result.json"
