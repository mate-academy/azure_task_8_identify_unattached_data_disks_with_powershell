$allDisks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$unattached = @()
$unattached = $allDisks | Where-Object { -not $_.ManagedBy -or $_.DiskState -eq 'Unattached' }
$json = $unattached | ConvertTo-Json
Out-File -FilePath 'result.json' -InputObject $json -Encoding utf8
