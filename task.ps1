$rg = "mate-azure-task-5"
$output = "result.json"

$unattachedDisks = Get-AzDisk -ResourceGroupName $rg | Where-Object { $_.DiskState -eq "Unattached" }

@($unattachedDisks) | ConvertTo-Json -Depth 10 | Out-File -FilePath $output -Encoding utf8

Write-Host "Done. Found $(@($unattachedDisks).Count) disks."

