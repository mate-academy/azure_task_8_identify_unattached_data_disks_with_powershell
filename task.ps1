$resourceGroupName = 'mate-azure-task-5'

Get-AzDisk -ResourceGroupName $resourceGroupName | ForEach-Object {
    if ($_.DiskState -eq 'Unattached') {
        Write-Output "Found unattached disk: $($_.Name)"
        $_
    }
    else {
        Write-Output "Skipping disk: $($_.Name) (State: $($_.DiskState))"
    }
} |
ConvertTo-Json -Depth 3 |
Out-File ./result.json
