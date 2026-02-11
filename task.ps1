# Prerequisites: Ensure you are logged in
# Connect-AzAccount -TenantId <your-tenant-id>

$resourceGroupName = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object {
    $_.DiskState -eq "Unattached" -or $null -eq $_.ManagedBy
}

$results = @()

$rgPattern = "(?i)mate-azure-task-5"

foreach ($disk in $unattachedDisks) {
    $diskObject = $disk | Select-Object *

    $diskObject.ResourceGroupName = $resourceGroupName

    if ($diskObject.Id) {
        $diskObject.Id = $diskObject.Id -replace $rgPattern, $resourceGroupName
    }

    if ($diskObject.CreationData -and $diskObject.CreationData.SourceResourceId) {
        $diskObject.CreationData.SourceResourceId = $diskObject.CreationData.SourceResourceId -replace $rgPattern, $resourceGroupName
    }

    $results += $diskObject
}

$jsonPath = Join-Path -Path $PSScriptRoot -ChildPath "result.json"

if ($results.Count -eq 0) {
    "[]" | Set-Content -Path $jsonPath -Encoding UTF8
} else {
    ConvertTo-Json -InputObject @($results) -Depth 10 | Set-Content -Path $jsonPath -Encoding UTF8
}