$unattachedDisks = @()
$resourceGroup = "mate-azure-task-5"
$result = './result.json'
$disks = Get-AzDisk -ResourceGroupName $resourceGroup

foreach($disk in $disks){
    if ($disk.DiskState -eq 'Unattached'){
        $unattachedDisks += $disk
    }
}

ConvertTo-Json -InputObject $unattachedDisks -Depth 10 | Out-File $result
