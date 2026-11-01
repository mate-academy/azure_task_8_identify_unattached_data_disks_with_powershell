$rgName = "mate-azure-task-5"
$vmName = "test2"

Write-Host "Unmounting disk inside the VM..."
Invoke-AzVMRunCommand -ResourceGroupName $rgName -VMName $vmName -CommandId 'RunShellScript' -ScriptString "sudo umount /data || true"

$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
if ($vm.StorageProfile.DataDisks.Count -gt 0) {
    Write-Host "Detaching data disk..."
    $diskName = $vm.StorageProfile.DataDisks[0].Name
    Remove-AzVMDataDisk -VM $vm -Name $diskName
    Update-AzVM -ResourceGroupName $rgName -VM $vm
} else {
    Write-Host "Disk is already detached. Skipping detachment."
}

Write-Host "Finding unattached disks..."
$unattachedDisks = Get-AzDisk -ResourceGroupName $rgName | Where-Object { $_.DiskState -eq 'Unattached' }

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -Path ".\result.json"