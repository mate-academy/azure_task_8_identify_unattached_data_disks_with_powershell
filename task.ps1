$VirtualMachine = Get-AzVM -ResourceGroupName "mate-azure-task-5" -Name "azure-task-2"
Remove-AzVMDataDisk -VM $VirtualMachine -Name "azure-task-2"
Update-AzVM -ResourceGroupName "mate-azure-task-5" -VM $VirtualMachine
Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object {$_.DiskState -eq "Unattached" } | ConvertTo-Json | Out-File -Path "result.json"
