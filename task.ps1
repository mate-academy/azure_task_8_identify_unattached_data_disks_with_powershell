# Write your code here

# $VirtualMachine = Get-AzVM -ResourceGroupName "mate-azure-task-5" -Name "ds-vm1"
# Remove-AzVMDataDisk -VM $VirtualMachine -Name "ds-disk-1"
# Update-AzVM -ResourceGroupName "mate-azure-task-5" -VM $VirtualMachine

$allDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$unattachedDisks = $allDisks | Where-Object { $_.ManagedBy -eq $null -or $_.DiskState -eq 'Unattached' }

$unattachedDisks | Select-Object -Property Id, Name, DiskSizeGB, DiskState | ConvertTo-Json | Set-Content -Path "./result.json"
