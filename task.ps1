$disks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$unattachedDisks = $disks | Where-Object {
  (($_.ManagedBy -eq $null -or $_.ManagedBy -eq "") -or ($_.DiskState -ieq "Unattached")) -and ($_.OsType -eq $null)
}

$unattachedDisks | ConvertTo-Json -Depth 4 | Out-File -FilePath "./result.json" -Encoding utf8 -Force