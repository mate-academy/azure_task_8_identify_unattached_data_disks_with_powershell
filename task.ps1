$DiskList = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$UnattachedDisks = @()

foreach ($disk in $DiskList)
{
    if ($disk.DiskState -eq "Unattached" -or $disk.ManagedBy -eq $null)
    {
        $UnattachedDisks += $disk
    }
}

$JsonResult = $UnattachedDisks | ConvertTo-Json

$JsonResult | Out-File -FilePath "./result.json" -Encoding utf8
