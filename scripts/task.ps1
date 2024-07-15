# Connect to your Azure account
Connect-AzAccount -TenantId 63194254-f864-45c1-b9a5-6dc209d8231d

# Get all disks in the resource group
$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

# Log all disks for debugging
Write-Output "All disks in resource group:"
$disks | Format-Table Name, DiskState, ManagedBy

# Filter out only unattached disks
$unattachedDisks = $disks | Where-Object { $_.DiskState -eq 'Unattached' -or !$_.ManagedBy }

# Log unattached disks for debugging
Write-Output "Unattached disks:"
$unattachedDisks | Format-Table Name, DiskState, ManagedBy

# Convert the results to JSON
$result = $unattachedDisks | ConvertTo-Json -Depth 4

# Save the JSON to a file in the scripts directory
Set-Content -Path "$PSScriptRoot/scripts/result.json" -Value $result

Write-Output "Unattached disks information saved to result.json in the scripts directory"
