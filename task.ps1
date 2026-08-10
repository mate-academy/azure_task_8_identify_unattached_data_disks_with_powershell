$resultFile = "./result.json"

$unattachedDisks = Get-AzDisk | Where-Object { $_.DiskState -eq "Unattached"}

if ($unattachedDisks.Count -gt 0) {
    $unattachedDisks | ConvertTo-Json | Out-File -FilePath $resultFile
}