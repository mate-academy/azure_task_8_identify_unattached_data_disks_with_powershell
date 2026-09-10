# Write your code here
$resourceGroupName = "mate-azure-task-5"

# Отримуємо всі диски в групі ресурсів та фільтруємо ті, що не мають прив'язки (ManagedBy = null)
$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName | Where-Object { $_.ManagedBy -eq $null }

# Експортуємо інформацію у форматі JSON у файл result.json
$unattachedDisks | ConvertTo-Json -Depth 10 | Set-Content -Path "result.json"