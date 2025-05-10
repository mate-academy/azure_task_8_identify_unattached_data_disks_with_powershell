$result = Get-AzDisk | Where-Object {$_.DiskState -eq "Unattached" -and $_.ResourceGroupName -ieq "mate-azure-task-5"}

$result | Select-Object Name, DiskState, ResourceGroupName | ConvertTo-Json | Set-Content -Path "result.json"

