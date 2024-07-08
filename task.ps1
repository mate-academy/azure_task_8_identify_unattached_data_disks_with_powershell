# Від'єднання диска від віртуальної машини
$Group5 = "mate-azure-task-5"
$vm = Get-AzVM -ResourceGroupName $Group5 -Name "mate-vm"

$vm = Remove-AzVMDataDisk -VM $vm -Name "disc-ssd-task3"

Update-AzVM -ResourceGroupName $Group5 -VM $vm

# Фільтрування незакріплених дисків
$disks = Get-AzDisk -ResourceGroupName $Group5
$unattachedDisks = $disks | Where-Object { $_.ManagedBy -eq $null -and $_.DiskState -ne "Attached" }

$unattachedDisks | Select-Object -Property Id, Name, DiskSizeGB, DiskState | ConvertTo-Json | Set-Content -Path "./result.json"
