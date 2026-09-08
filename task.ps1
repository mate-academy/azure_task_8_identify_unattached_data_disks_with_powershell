# Параметри
$resourceGroupName = "mate-azure-task-5"
$outputFile = "result.json"

# 1. Пошук ВМ у групі ресурсів та від'єднання диска
$vms = Get-AzVM -ResourceGroupName $resourceGroupName

foreach ($vm in $vms) {
    if ($vm.StorageProfile.DataDisks.Count -gt 0) {
        foreach ($dataDisk in $vm.StorageProfile.DataDisks) {
            $diskName = $dataDisk.Name
            Write-Host "Знайдено підключений диск '$diskName' на ВМ '$($vm.Name)'."

            # 2. Розмонтування диска всередині ОС ВМ
            Write-Host "Спроба розмонтування диска всередині ОС..."
            try {
                Invoke-AzVMRunCommand -ResourceGroupName $resourceGroupName `
                    -VMName $vm.Name `
                    -CommandId 'RunShellScript' `
                    -ScriptString "sudo umount -a 2>/dev/null || true"
            } catch {
                Write-Warning "Не вдалося розмонтувати диск через RunCommand, продовжуємо від'єднання..."
            }

            # 3. Від'єднання диска на рівні Azure
            Write-Host "Від'єднання диска '$diskName' від ВМ '$($vm.Name)'..."
            Remove-AzVMDataDisk -VM $vm -Name $diskName
            Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm
        }
    }
}

# 4. Пошук усіх непідключених дисків у групі ресурсів
Write-Host "Пошук непідключених дисків..."
$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName | Where-Object {
    $_.DiskState -eq 'Unattached' -or [string]::IsNullOrEmpty($_.ManagedBy)
}

# 5. Збереження результату у result.json
$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $outputFile -Encoding utf8
Write-Host "Інформація про непідключені диски збережена в $outputFile."

# 6. Видалення групи ресурсів
Write-Host "Видалення групи ресурсів $resourceGroupName..."
Remove-AzResourceGroup -Name $resourceGroupName -Force
