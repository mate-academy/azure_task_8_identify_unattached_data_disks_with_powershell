# Write your code here
Connect-AzAccount

$resourceGroupName = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object { $_.ManagedBy -eq $null }

if ($unattachedDisks.Count -eq 0) {
    Write-Host "Немає невід'єднаних дисків"
} else {
    $unattachedDisks | Select-Object Name, DiskState | ConvertTo-Json -Compress | Out-File result.json
    Write-Host "Інформація про невід'єднані диски збережена в result.json"
}

$unattachedDisks | Format-Table Name, DiskState, ManagedBy

