# Resource Group where the VM is deployed
$resourceGroupName = "mate-azure-task-5"

# Initialize an empty list to store information about unattached disks
$unattachedDisksInfo = @()

try {
    # Connect to Azure if not already connected
    if (-not (Get-AzContext)) {
        Connect-AzAccount
    }

    # Get all disks in the specified resource group
    $allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

    # Filter for unattached disks based on DiskState or ManagedBy properties
    $unattachedDisks = $allDisks | Where-Object {
        $_.DiskState -eq 'Unattached'
    }

    # Iterate through the unattached disks and collect relevant information
    foreach ($disk in $unattachedDisks) {
        $diskInfo = [PSCustomObject]@{
            Name              = $disk.Name
            ResourceGroupName = $disk.ResourceGroupName
            DiskState         = $disk.DiskState
            DiskSizeBytes     = $disk.DiskSizeBytes
            SkuName           = $disk.Sku.Name
            CreationTime      = $disk.TimeCreated
            ManagedBy         = $disk.ManagedBy
            Location          = $disk.Location
        }
        $unattachedDisksInfo += $diskInfo
    }

    # Convert the information about unattached disks to JSON format
    $resultJson = ConvertTo-Json -InputObject $unattachedDisksInfo -Depth 2

    # Define the path for the output JSON file
    $resultFilePath = "./result.json"

    # Export the result to the result.json file
    $resultJson | Out-File -Path $resultFilePath

    # Output a message indicating the script has finished
    Write-Host "Script finished. Information about unattached disks in resource group '$resourceGroupName' has been exported to result.json"
}
catch {
    Write-Error "An error occurred: $($_.Exception.Message)"
    exit 1
}