# Вказуємо назву ресурсної групи
$resourceGroup = "mate-azure-task-5"

# Отримуємо всі диски з цієї групи
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroup

# Фільтруємо unattached диски (ManagedBy пустий або null)
$unattachedDisks = $allDisks | Where-Object {
    -not $_.ManagedBy  # якщо ManagedBy пустий або null
}

# Записуємо інформацію у JSON у файл result.json
$unattachedDisks | ConvertTo-Json | Set-Content -Path "./result.json"
