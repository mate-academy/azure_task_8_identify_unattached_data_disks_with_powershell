$resourceGroupName = "mate-azure-task-2-ukwest"

$resultFilePath = "$PSScriptRoot/scripts/result.json"

Write-Output "Пошук всіх дисків у групі ресурсів '$resourceGroupName'..."

try {
    $allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName -ErrorAction Stop
}
catch {
    Write-Error "Помилка при отриманні дисків з групи ресурсів '$resourceGroupName'. Перевірте, чи існує група ресурсів і чи маєте ви до неї доступ. Оригінальна помилка: $($_.Exception.Message)"
    exit 1
}

Write-Output "Фільтрація непідключених дисків..."

$unattachedDisks = $allDisks | Where-Object { $_.DiskState -eq "Unattached" }

Write-Output "Знайдено $($unattachedDisks.Count) непідключених дисків."

if ($unattachedDisks.Count -eq 1) {
    $diskToSave = $unattachedDisks | Select-Object Name, DiskState, ResourceGroupName, Location, DiskSizeGB, @{Name='CreationTime';Expression={$_.TimeCreated.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")}}
    
    $diskToSave | ConvertTo-Json -Depth 5 | Out-File $resultFilePath -Encoding UTF8 -Force
    Write-Output "Інформацію про непідключений диск успішно збережено до '$resultFilePath'."
}
elseif ($unattachedDisks.Count -gt 1) {
    Write-Warning "Знайдено більше одного непідключеного диска ($($unattachedDisks.Count)). Валідатор очікує тільки один непідключений диск. Перевірте вашу інфраструктуру (група ресурсів повинна мати лише 2 Azure Disk ресурси: один для ОС, один для від'єднаного диску даних) або логіку фільтрації."
    
    $diskToSave = $unattachedDisks[0] | Select-Object Name, DiskState, ResourceGroupName, Location, DiskSizeGB, @{Name='CreationTime';Expression={$_.TimeCreated.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")}}
    $diskToSave | ConvertTo-Json -Depth 5 | Out-File $resultFilePath -Encoding UTF8 -Force
    Write-Output "Інформацію про перший знайдений непідключений диск збережено до '$resultFilePath' для валідації."
}
else {
    Write-Warning "Не знайдено жодного непідключеного диска у групі ресурсів '$resourceGroupName'. Переконайтеся, що диск даних був від'єднаний від ВМ."
    @{ } | ConvertTo-Json | Out-File $resultFilePath -Encoding UTF8 -Force
    Write-Output "Порожній JSON-файл '$resultFilePath' створено, оскільки не знайдено непідключених дисків."
}
