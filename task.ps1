Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$resourceGroupName = 'mate-azure-task-5'
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$resultPath = Join-Path $scriptDirectory 'result.json'

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks |
    Where-Object { $_.DiskState -eq 'Unattached' } |
    Select-Object `
        Name,
        ResourceGroupName,
        Location,
        DiskSizeGB,
        DiskState,
        ManagedBy,
        OsType,
        Sku,
        Id

$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $resultPath -Encoding utf8
