#command for SSH
# ssh nook17@10.0.1.4
# dmesg | grep SCSI
# sudo -i blkid
# Open /etc/fstab
# Remove artical about our disk
# sudo umount /dev/sdc1 /data
# Write your code here

#Command for PowerShell
$VirtualMachine = Get-AzVM `
  -ResourceGroupName "mate-azure-task-5" `
  -Name "demo-vm"
Remove-AzVMDataDisk `
  -VM $VirtualMachine `
  -Name "demo-disk"
Update-AzVM `
  -ResourceGroupName "mate-azure-task-5" `
  -VM $VirtualMachine

$disks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$result = @()

foreach ($disk in $disks) {
    if ($disk.DiskState -eq "Unattached") {
        $result += $disk
    }
}
$result | ConvertTo-Json | Out-File -Path ./result.json