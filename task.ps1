# task.ps1 — знайти unattached диски у ресурсній групі
$ResourceGroup = "mate-azure-task-5"
$OutputFile    = "result.json"

$disks = Get-AzDisk -ResourceGroupName $ResourceGroup

$unattached = $disks | Where-Object {
    [string]::IsNullOrEmpty($_.ManagedBy) -or $_.DiskState -eq "Unattached"
}

$result = @(
    $unattached | Select-Object Name, Location, DiskSizeGB, DiskState, ManagedBy, Id
)

@($result) | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $OutputFile -Encoding UTF8

Write-Host "✅ Знайдено від’єднаних дисків: $(@($unattached).Count)"
Write-Host "📝 Результат збережено у: $OutputFile"