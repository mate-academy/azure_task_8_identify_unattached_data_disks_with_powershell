# Write your code here
# task.ps1
# -----------------------------
# Завдання: знайти всі unattached (від’єднані) диски у ресурсній групі
# та зберегти їх у result.json

$resourceGroup = "mate-azure-task-5"
$outputFile = "result.json"

# Отримуємо всі диски в ресурсній групі
$disks = Get-AzDisk -ResourceGroupName $resourceGroup

# Фільтруємо лише ті, що не прикріплені до VM
$unattached = $disks | Where-Object { $_.ManagedBy -eq $null -or $_.DiskState -eq "Unattached" }

# Вибираємо важливі властивості
$result = $unattached | Select-Object Name, Location, DiskSizeGB, DiskState

# Експортуємо у JSON
$result | ConvertTo-Json -Depth 3 | Set-Content -LiteralPath $outputFile -Encoding UTF8

Write-Host "✅ Знайдено від’єднаних дисків: $($unattached.Count)"
Write-Host "Результат збережено у $outputFile"