$disks = foreach($disk in Get-AzDisk -ResourceGroupName mate-azure-task-5) {
    if ($null -eq $disk.ManagedBy) {
        $disk
    }
}

$disks | ConvertTo-Json | Out-File ./result.json
