$resourceGroupName = "mate-azure-task-5"

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $allDisks | Where-Object {
    $_.DiskState -eq "Unattached" -or [string]::IsNullOrEmpty($_.ManagedBy)
}

$result = @()
foreach ($disk in $unattachedDisks) {
    $result += @{
        Name = $disk.Name
        Id = $disk.Id
        DiskState = $disk.DiskState
        ManagedBy = $disk.ManagedBy
        SizeGB = $disk.DiskSizeGB
        Location = $disk.Location
        ResourceGroup = $disk.ResourceGroupName
        Sku = $disk.Sku.Name
    }
}

$result | ConvertTo-Json -Depth 10 | Out-File -FilePath "result.json" -Encoding UTF8

Write-Host "Found $($result.Count) unattached disks"
