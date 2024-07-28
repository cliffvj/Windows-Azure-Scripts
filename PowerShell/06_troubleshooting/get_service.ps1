# Get Windows Services (all)
Get-Service

# Running Services
Get-Service | Where-Object {$_.Status -eq "Running"}

# Stopped Services
Get-Service | Where-Object {$_.Status -eq "Stopped"}
