# Import required Az module
Import-Module Az.Compute

# Define resource group name
$resourceGroupName = "mate-azure-task-5"

# Get all disks in the resource group
$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

# Filter unattached disks (those that are not managed by any VM)
$unattachedDisks = $disks | Where-Object { !$_.ManagedBy }

# Convert the result to JSON and save to result.json
$unattachedDisks | ConvertTo-Json -Depth 2 | Set-Content -Path "result.json"

Write-Host "Unattached disks have been saved to result.json"
# Write your code here
