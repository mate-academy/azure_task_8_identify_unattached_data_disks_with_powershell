# Finds all unattached managed disks in the task resource group and saves them to result.json

$rgName = "mate-azure-task-5"
$resultPath = Join-Path $PWD "result.json"

$disks = Get-AzDisk -ResourceGroupName $rgName

$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json -Depth 20 | Out-File -FilePath $resultPath -Force
