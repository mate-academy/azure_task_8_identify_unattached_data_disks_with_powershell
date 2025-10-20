# task.ps1

$allDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$unattachedDisks = $allDisks | Where-Object {
    -not $_.ManagedBy -or $_.DiskState -eq "Unattached"
}

$unattachedDisks | ConvertTo-Json -Depth 5 | Out-File "result.json" -Encoding utf8
