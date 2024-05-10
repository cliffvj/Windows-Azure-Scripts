# List AZ Resource Providers that are registered
Get-AzResourceProvider -Location "eastasia"

# Count
Get-AzResourceProvider -Location "eastasia" | Measure-Object

# List all that are available 
Get-AzResourceProvider -Location "eastasia" -ListAvailable
Get-AzResourceProvider -Location "eastasia" -ListAvailable | Where-Object {$_.RegistrationState -eq 'NotRegistered'} | Format-Table