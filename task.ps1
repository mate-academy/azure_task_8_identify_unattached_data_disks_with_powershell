$results = Get-AzDisk | Where-Object {
    $_.ResourceGroupName -eq 'mate-azure-task-5' -and
    $_.DiskState -eq 'Unattached'
}
$results | ConvertTo-Json | Out-File -Path "./result.json"
