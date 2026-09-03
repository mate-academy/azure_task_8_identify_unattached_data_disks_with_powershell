#command for SSH
ssh nook17@10.0.1.4
dmesg | grep SCSI
sudo -i blkid
Open /etc/fstab
Remove artical about our disk
sudo umount /dev/sdc1 /data
Check /proc/mounts disk should be unmounted
# Write your code here

#Command for PowerShell

try {
    $VirtualMachine = Get-AzVM -ResourceGroupName "mate-azure-task-5" -Name "demo-vm"
    Remove-AzVMDataDisk -VM $VirtualMachine -Name "demo-disk"
    Update-AzVM -ResourceGroupName "mate-azure-task-5" -VM $VirtualMachine

    do {
        $disk = Get-AzDisk -ResourceGroupName "mate-azure-task-5" -Name "demo-disk"
        if ($disk.DiskState -ne "Unattached") {
            Start-Sleep -Seconds 5
        }
    } while ($disk.DiskState -ne "Unattached")
    

    $disks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
    $result = @()
    foreach ($disk in $disks) {
        if ($disk.DiskState -eq "Unattached") {
            $result += $disk
        }
    }
    $result | ConvertTo-Json | Out-File -Path ./result.json
}
catch {
    Write-Host "Error: $_"
}
