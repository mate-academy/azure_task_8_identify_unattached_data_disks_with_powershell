# Write your code here
$resourceGroupName5 = "mate-azure-task-5"
$nameVM = "test-alexhVM"
$nameResourse = "mate-azute-task-3"
$VirtualMachine = Get-AzVM -ResourceGroupName $resourceGroupName5 -Name $nameVM
# Get all disks in the specified resource group
Remove-AzVMDataDisk -VM $VirtualMachine -Name $nameResourse
Update-AzVM -ResourceGroupName $resourceGroupName5 -VM $VirtualMachine

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName5

# Filter unattached disks
$unattachedDisks = $allDisks | Where-Object {
    $_.ManagedBy -eq $null -or $_.DiskState -eq "Unattached"
}

$resultFilePath = "./result.json"
# Select only the necessary properties to save to the JSON file and convert to JSON and save result to the result.json file
$unattachedDisks | Select-Object -Property Id, Name, DiskSizeGb, DiskState | ConvertTo-Json | Set-Content -Path $resultFilePath

