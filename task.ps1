$ResourceGroupName = "mate-azure-task-5"
$ResultFilePath = Join-Path $PSScriptRoot "result.json"

$AllDisks = Get-AzDisk -ResourceGroupName $ResourceGroupName

$UnattachedDisks = $AllDisks |
    Where-Object { $_.DiskState -eq "Unattached" }

$UnattachedDisks |
    ConvertTo-Json -Depth 10 |
    Set-Content -Path $ResultFilePath -Encoding utf8