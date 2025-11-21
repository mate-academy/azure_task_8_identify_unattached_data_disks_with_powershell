# task.ps1

# Визначення змінних
$targetResourceGroup = "mate-azure-task-5" # або MATE-AZURE-TASK-5
$resultFile = "./result.json"

# 1. Отримання всіх дисків у цільовій групі ресурсів
$allDisks = Get-AzDisk -ResourceGroupName $targetResourceGroup

# 2. Фільтрація: пошук неприєднаних дисків
$unattachedDisks = $allDisks | Where-Object {
    $_.ManagedBy -eq $null -or $_.DiskState -eq 'Unattached'
}

# 3. Експорт результату
$unattachedDisks | ConvertTo-Json -Depth 10 | Set-Content $resultFile -Encoding UTF8

Write-Host "Found $($unattachedDisks.Count) unattached disk(s). Result saved to $resultFile."