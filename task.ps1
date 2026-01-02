$disks = foreach($disk in Get-AzDisk) {
    if ($null -eq $disk.ManagedBy) {
        $disk
    }
}

$disks | ConvertTo-Json | Out-File ./result.json
