# Write your code here
$disks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$result = @()

foreach ($disk in $disks) {
    if ($disk.DiskState -eq "Unattached") {
        $result += $disk
    }
}
$result | ConvertTo-Json | Out-File -Path ./result.json