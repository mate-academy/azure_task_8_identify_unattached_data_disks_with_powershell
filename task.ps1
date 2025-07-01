$resourceGroup = "mate-azure-task-5"
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisk = $allDisks | Where-Object {
  ($_.DiskState -eq "Unattached")
}

$unattachedDisk | ConvertTo-Json -Depth 5 | Set-Content -Path "./result.json"