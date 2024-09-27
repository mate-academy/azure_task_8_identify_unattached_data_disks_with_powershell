$disk_list = Get-AzDisk
$resultJson = "./result.json"

$unattachedDisks = @()

foreach ($disk in $disk_list) {
    # Check if the disk is unattached and belongs to 'MATE-AZURE-TASK-5'
    if (($disk.DiskState -eq "Unattached" -or $null -eq $disk.ManagedBy) -and $disk.ResourceGroupName -eq "MATE-AZURE-TASK-5") {
        $unattachedDisks += $disk
    }
}

$unattachedDisks | ConvertTo-Json | Out-File -Path $resultJson
