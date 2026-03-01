$rg = "mate-azure-task-5"
$output = "result.json"

# Получаем диски и фильтруем отсоединенные
$unattachedDisks = Get-AzDisk -ResourceGroupName $rg | Where-Object { $_.DiskState -eq "Unattached" }

# Используем @(), чтобы результат всегда был массивом в JSON
@($unattachedDisks) | ConvertTo-Json -Depth 10 | Out-File -FilePath $output -Encoding utf8

Write-Host "Найдено дисков: $(@($unattachedDisks).Count). Результат сохранен в массив в $output"

