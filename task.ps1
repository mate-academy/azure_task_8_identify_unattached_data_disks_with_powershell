param(
    [string]$ResourceGroupName = "mate-azure-task-5"
)

Write-Host "Пошук невикористовуваних дисків в $ResourceGroupName..."

# Отримайте всі диски в resource group
$allDisks = Get-AzDisk -ResourceGroupName $ResourceGroupName

# Фільтруйте невикористовувані диски
$unattachedDisks = $allDisks | Where-Object {
    $_.DiskState -eq "Unattached" -or [string]::IsNullOrEmpty($_.ManagedBy)
}

# Покажіть результати
Write-Host "✓ Знайдено $($unattachedDisks.Count) невикористовуваних дисків"
$unattachedDisks | Select-Object Name, DiskState, ManagedBy, DiskSizeGB

# Перетворіть результати в JSON
$result = @()
foreach ($disk in $unattachedDisks) {
    $result += @{
        Name = $disk.Name
        Id = $disk.Id
        DiskState = $disk.DiskState
        ManagedBy = $disk.ManagedBy
        SizeGB = $disk.DiskSizeGB
        Location = $disk.Location
        ResourceGroup = $disk.ResourceGroupName
        Sku = $disk.Sku.Name
    }
}

# Збережіть результати в result.json
$result | ConvertTo-Json -Depth 10 | Out-File -FilePath "result.json" -Encoding UTF8

Write-Host "✓ Результати збережені в result.json"