# Define the resource group name
$resourceGroupName = "mate-azure-task-5"

# Get all disks in the resource group
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

# Filter to get only unattached disks (where DiskState is "Unattached")
$unattachedDisks = $allDisks | Where-Object { $_.DiskState -eq "Unattached" }

# Export the unattached disks to result.json in JSON format
$unattachedDisks | ConvertTo-Json -Depth 10 | Set-Content -Path "result.json"

# Display summary
Write-Host "Found $($unattachedDisks.Count) unattached disk(s) in resource group '$resourceGroupName'"
if ($unattachedDisks.Count -gt 0) {
    Write-Host "Unattached disk(s):"
    $unattachedDisks | ForEach-Object { Write-Host "  - $($_.Name) (State: $($_.DiskState))" }
}

