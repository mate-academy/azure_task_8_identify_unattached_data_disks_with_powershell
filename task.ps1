
$resourceGroupName = "mate-azure-task-5"
$vmName = "mate-demo-vm"
$diskName = "mate-demo-data"

# Отримуємо конфігурацію VM
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Від'єднуємо диск від VM
$vm = Remove-AzVMDataDisk -VM $vm -Name $diskName

# Застосовуємо зміни
Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm

# Отримуємо від'єднані диски
$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName |
    Where-Object { $_.DiskState -eq "Unattached" }

# Зберігаємо результат
$unattachedDisks | ConvertTo-Json -Depth 10 |
    Out-File -FilePath "$PWD/result.json" -Encoding utf8
