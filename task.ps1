$list = Get-AzDisk -ResourceGroupName "mate-azure-task-5"
$listOfUnattachedDisks = $list | Where-Object {$_.ManagedBy -eq $null}
$listOfUnattachedDisks | ConvertTo-Json | Out-File -Path ./result.json