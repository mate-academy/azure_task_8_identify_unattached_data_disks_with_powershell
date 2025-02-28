$RG_NAME = "mate-azure-task-5"
$RESULT_FILE_NAME = "result.json"

$detachedDisks = Get-AzDisk | Where-Object {$_.DiskState -eq "Unattached" -and $_.ResourceGroupName -eq $RG_NAME}
$detachedDisks | ConvertTo-Json | Add-Content -Path $RESULT_FILE_NAME
