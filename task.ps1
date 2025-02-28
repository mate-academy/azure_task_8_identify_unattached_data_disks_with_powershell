# Deataching of disk was executed by running commented commands below
# in powerShell before running this script
# $VirtualMachine = Get-AzVM -ResourceGroupName "mate-azure-task-5" -Name "vm-mate-azure-task-2"
# Remove-AzVMDataDisk -VM $VirtualMachine -Name "vm-data-disk"
# Update-AzVM -ResourceGroupName "mate-azure-task-5" -VM $VirtualMachine

$resultFile = "result.json"

$allDisks = Get-AzDisk -ResourceGroupName "mate-azure-task-5"
$filteredDisks = $allDisks | Where-Object { $_.DiskState -eq "Unattached" }

if ($filteredDisks.Count -gt 0) {
  $filteredDisks | ConvertTo-Json -Depth 1 | Set-Content -Path $resultFile
  Write-Output "Інфоррмація про від'єднані диски збережено в $resultFile"
}
else {
  Write-Output "Не знайдено жодного від'єднаного диску"
}
