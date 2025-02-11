$resourceGroup = "mate-azure-task-5"
$resultOut = "$PSScriptRoot\result.json"

$diskVM = Get-AzDisk -ResourceGroupName $resourceGroup

$disconnect = $diskVM | Where-Object {$_.DiskState -eq "Unattached"}
$disconnect | ConvertTo-Json -Depth 5 | Set-Content -Path $resultOut -Encoding UTF8
