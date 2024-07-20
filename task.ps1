Get-AzDisk |
  Where-Object {$_.DiskState -eq "Unattached"} |
  ConvertTo-Json |
  Set-Content -Path ".\result.json"
