$resourceGroupName = "mate-azure-task-5"
$vmName = "mate5-vm"
$resultPath = Join-Path $PSScriptRoot "result.json"

# Step 1: detach a data disk from the VM if one is still attached.
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -ErrorAction SilentlyContinue
if ($vm -and $vm.StorageProfile.DataDisks -and $vm.StorageProfile.DataDisks.Count -gt 0) {
    $dataDisk = $vm.StorageProfile.DataDisks[0]
    $vm = Remove-AzVMDataDisk -VM $vm -Name $dataDisk.Name
    Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm | Out-Null
}

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName
$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $resultPath -Force
