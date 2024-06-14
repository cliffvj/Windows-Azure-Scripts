# Set TrustedHosts using their IP
Set-Item WSMan:\localhost\Client\TrustedHosts -Value 10.0.0.10

# Check TrustedHosts list if added
Get-Item WSMan:\localhost\Client\TrustedHosts
