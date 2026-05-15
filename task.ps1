#! /usr/lib64/powershell/pwsh

# ssh azureuser@10.0.1.4

# dmesg | grep SCSI

# sudo -i blkid

# sudo nano /etc/fstab

# releting from fstab UUID=33333333-3b3b-3c3c-3d3d-3e3e3e3e3e3e   /datadrive   ext4   defaults,nofail   1   2

# sudo umount /dev/sdc1 /datadrive

Connect-AzAccount -TenantId <my-tenant-id>

$resourceGroup = "mate-azure-task-5"

$vms = Get-AzVM -ResourceGroupName $resourceGroup

foreach ($vm in $vms) {

    if ($vm.StorageProfile.DataDisks.Count -gt 0) {


        $diskNames = @($vm.StorageProfile.DataDisks.Name)

        foreach ($diskName in $diskNames) {

            $vm = Remove-AzVMDataDisk -Name $diskName -VM $vm
        }


        Update-AzVM -ResourceGroupName $resourceGroup -VM $vm
    }
}


Get-AzDisk | Where-Object {$_.ResourceGroupName -eq $resourceGroup} | Where-Object {$_.DiskState -eq "Unattached"} | ConvertTo-Json | Out-File result.json