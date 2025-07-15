# Write your code here
$ResourceGroupName = 'mate-azure-task-5'
$allDisks = Get-AzDisk -ResourceGroupName $ResourceGroupName

Write-Host "Find unattached disks in Resource Group: '$ResourceGroupName'"

$UnatechedDisk = @()


foreach ($disc in $allDisks){

  $DiskState = $disc.DiskState

  if ($DiskState -eq 'Unattached'){
    Write-Host "  -> Unattached disk found:'$disk.Name' "
    $UnatechedDisk += $disc
  }

  }

$UnatechedDisk | ConvertTo-Json | Set-Content -Path "result.json"
Write-Host "Result save to result.json"