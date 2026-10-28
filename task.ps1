$rg = "mate-azure-task-5-swedencentral"

$disks = Get-AzDisk -ResourceGroupName $rg

$unattachedDisks = @($disks | Where-Object { $_.DiskState -eq "Unattached" })

ConvertTo-Json -InputObject $unattachedDisks -Depth 20 |
    Set-Content -Path "./result.json"