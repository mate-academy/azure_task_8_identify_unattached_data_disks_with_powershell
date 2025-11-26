# Write your code here
$rg = "mate-azure-task-5"
$disk = Get-AzDisk -ResourceGroupName $rg
$unattached = $disk | Where-Object {
    $_.ManagedBy -eq $null -or $_.DiskState -eq "Unattached"
}
$unattached | ConvertTo-Json -Depth 5 | Out-File "./result.json"
