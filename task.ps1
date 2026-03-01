# Write your code here
$rg = "mate-azure-task-5"
$output = "result.json"

# Получаем диски и фильтруем только отсоединенные (Unattached)
$unattachedDisks = Get-AzDisk -ResourceGroupName $rg | Where-Object { $_.DiskState -eq "Unattached" }

# Сохраняем в JSON с достаточной глубиной вложенности
$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $output -Encoding utf8

Write-Host "Найдено дисков: $($unattachedDisks.Count). Результат записан в $output"

