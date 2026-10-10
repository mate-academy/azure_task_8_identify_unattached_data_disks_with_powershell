$discs = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$result = $discs | Where-Object {
    $_.DiskState -eq 'Unattached'
}

$result | ConvertTo-Json | Out-File -FilePath "result.json"