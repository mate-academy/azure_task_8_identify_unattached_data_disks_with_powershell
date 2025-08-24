# Write your code here
$ResourceGroupName = "mate-azure-task-5"
$ResultFile = Join-Path -Path $PSScriptRoot -ChildPath "result.json"

$AllDisks = Get-AzDisk -ResourceGroupName $ResourceGroupName

$UnattachedDisks = $AllDisks | Where-Object { -not $_.ManagedBy }

$UnattachedDisks | ConvertTo-Json -Depth 5 -Compress | Set-Content -Path $ResultFile -Encoding UTF8
