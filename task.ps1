$resultFilePath = "$PSScriptRoot\result.json"

$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$unattachedDisks = $disks | Where-Object {
    $_.DiskState -eq "Unattached" -or -not $_.ManagedBy
}

$unattachedDisks | Select-Object Name, Location, DiskSizeGB | ConvertTo-Json -Depth 10 | Out-File -FilePath $resultFilePath -Encoding UTF8

Write-Output "Information about unattached disks saved to $resultFilePath"
