$resourceGroupName = "mate-azure-task-2-ukwest"
$vmName = "TODOAPP-VM"
$dataDiskName = "disk-task-3"

Write-Host "Отримання об'єкта віртуальної машини '$vmName' у групі ресурсів '$resourceGroupName'..."
try {
    $vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -ErrorAction Stop
}
catch {
    Write-Error "Помилка при отриманні ВМ '$vmName'. Перевірте ім'я ВМ та групи ресурсів. Оригінальна помилка: $($_.Exception.Message)"
    exit 1
}

Write-Host "Пошук диска даних '$dataDiskName' у профілі зберігання ВМ..."
$dataDisk = $vm.StorageProfile.DataDisks | Where-Object { $_.Name -eq $dataDiskName }

if ($dataDisk) {
    Write-Host "Від'єднання диска '$dataDiskName' від ВМ '$vmName'..."
    $vm = Remove-AzVMDataDisk -VM $vm -Name $dataDisk.Name

    Write-Host "Оновлення віртуальної машини в Azure для застосування змін..."
    try {
        Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm -ErrorAction Stop
        Write-Host "Диск '$dataDiskName' успішно від'єднано від ВМ '$vmName'."
    }
    catch {
        Write-Error "Помилка при оновленні ВМ '$vmName' після від'єднання диска. Оригінальна помилка: $($_.Exception.Message)"
        exit 1
    }
}
else {
    Write-Warning "Диск даних '$dataDiskName' не знайдено у профілі ВМ '$vmName'. Перевірте ім'я диска."
    Write-Warning "Можливо, диск вже від'єднано або він має іншу назву."
}