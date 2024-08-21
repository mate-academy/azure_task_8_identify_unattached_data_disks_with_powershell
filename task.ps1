$disks = Get-AzDisk
$resultJson = "./result.json"

$matchingDisks = @()

foreach ($disk in $disks) {
    if ($disk.DiskState -eq "Unattached" -or $null -eq $disk.ManagedBy) {
        $matchingDisks += $disk
    }
}

$matchingDisks | ConvertTo-Json | Out-File -Path $resultJson
