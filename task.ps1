# Write your code here
$rgName = "mate-azure-task-5"
$vmName   = "task5-vm"
$diskName = "task5-datadisk"

$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Remove-AzVMDataDisk -VM $vm -Name $diskName
Update-AzVM -ResourceGroupName $rgName -VM $vm

$disks = Get-AzDisk -ResourceGroupName $rgName

$unattachedDisks = $disks | Where-Object {$_.DiskState -eq "Unattached" }
$unattachedDisks | ConvertTo-Json | Out-File -FilePath "result.json"