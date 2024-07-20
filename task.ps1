$VirtualMachine = Get-AzVM `
    -ResourceGroupName "mate-resources-ukwest" `
    -Name "mate-vm"
Remove-AzVMDataDisk `
    -VM $VirtualMachine `
    -Name "mate-task-2-disk"
Update-AzVM `
    -ResourceGroupName "mate-resources-ukwest" `
    -VM $VirtualMachine

$allDisks = Get-AzDisk -ResourceGroupName "mate-resources-ukwest"

$unattachedDisks = $allDisks | Where-Object { $_.ManagedBy -eq $null -or $_.DiskState -eq 'Unattached' }

$unattachedDisks | Select-Object -Property Id, Name, DiskSizeGB, DiskState | ConvertTo-Json | Set-Content -Path "./result.json"