$rg = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $rg

$unattached = $disks | Where-Object {
    $_.DiskState -eq "Unattached"
}

$unattached | ConvertTo-Json -Depth 5 | Set-Content "result.json"