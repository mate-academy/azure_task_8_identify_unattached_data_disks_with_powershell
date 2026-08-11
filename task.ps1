$allDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"

$unattachedDisks = $allDisks | Where-Object { $_.DiskState -eq "Unattached" }

$jsonOutput = ConvertTo-Json -InputObject @($unattachedDisks) -Depth 10

Out-File -InputObject $jsonOutput -FilePath "result.json" -Encoding utf8