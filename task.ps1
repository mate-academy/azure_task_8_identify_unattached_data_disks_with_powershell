$results = New-Object System.Collections.Generic.List[PSObject]

$AzureDisksOffline = Get-AzDisk -ResourceGroupName "mate-azure-task-5" | Where-Object {$_.DiskState -eq "Unattached"}

$results.Add($AzureDisksOffline)

$results | ConvertTo-Json -Depth 5 | Out-File -FilePath ".\result.json" -Encoding UTF8
