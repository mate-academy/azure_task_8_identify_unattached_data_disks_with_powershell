# Write your code here

# Define the resource group name
$resourceGroupName = "mate-azure-task-5"

# Get all disks in the specified resource group
$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

# Filter for unattached disks
   $unattachedDisks = $disks | Where-Object { ($_.ManagedBy -eq $null) -or ($_.DiskState -eq 'Unattached') }

# Prepare the result object
$result = @()

foreach ($disk in $unattachedDisks) {
    $result += [PSCustomObject]@{
        Name       = $disk.Name
        Location   = $disk.Location
        DiskState  = $disk.DiskState
        ManagedBy  = $disk.ManagedBy
    }
}

# Convert the result to JSON format
   $jsonResult = @($result) | ConvertTo-Json -Depth 4

# Save the JSON result to result.json
   $jsonResult | Out-File -FilePath (Join-Path $PSScriptRoot 'result.json') -Encoding utf8

# Output the result to console (optional)
Write-Output "Unattached disks saved to result.json"