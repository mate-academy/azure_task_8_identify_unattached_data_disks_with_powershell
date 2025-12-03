# Write your code here

Get-AzDisk -ResourceGroupName 'mate-azure-task-5' | Where-Object {!($_.ManagedBy)} | ConvertTo-Json | Out-File ./result.json

