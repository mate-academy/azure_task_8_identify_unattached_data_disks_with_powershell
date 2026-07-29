$result_list = @()
$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"
foreach ($disk in $disks) {
  if ($disk.DiskState -eq "Unattached") {
            $result_list += $disk
  }
}
$result_list | ConvertTo-Json | Out-File -Path ./result.json