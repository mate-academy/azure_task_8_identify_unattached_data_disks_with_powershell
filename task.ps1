# Write your code here

$resourceGroupName = "mate-azure-task-5"
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $allDisks | Where-Object {
    (-not $_.ManagedBy -or $_.DiskState -eq 'Unattached') -and
    ($_.OsType -eq $null)
}

$jsonElements = @()
foreach ($disk in $unattachedDisks) {
    $jsonElements += $disk | ConvertTo-Json -Depth 10
}

$jsonArray = "[`n" + ($jsonElements -join ",`n") + "`n]"

Set-Content -Path "result.json" -Value $jsonArray -Encoding utf8

