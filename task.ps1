if (-not (Get-Module -ListAvailable Az.Compute)) { return }
$rg = "mate-azure-task-5"
$allDisks = Get-AzDisk -ResourceGroupName $rg
$unattachedDisks = $allDisks | Where-Object { $_.DiskState -eq "Unattached" -or -not $_.ManagedBy }
$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath "./result.json" -Encoding utf8 -Force
