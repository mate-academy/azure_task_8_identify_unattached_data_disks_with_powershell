#$VirtualMachine = Get-AzVM -ResourceGroupName "mate-azure-task-5" -Name "mate-vm-task-2"
#Remove-AzVMDataDisk -VM $VirtualMachine -Name "mate-disk-task-3"
#Update-AzVM -ResourceGroupName "mate-azure-task-5" -VM $VirtualMachine

Write-Host "Checking 'mate-azure-task-5' resource group for unttached disks..."
$Disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object {$_.DiskState -eq "Unattached" -and $_.OsType -eq $null -and $_.ManagedBy -eq $null}

Write-Host ("Finded {0} disks" -f $Disks.Count)
Write-Host "Write result disks to 'result.json'..."
$Disks | ConvertTo-Json -AsArray | Out-File -Path "result.json"
