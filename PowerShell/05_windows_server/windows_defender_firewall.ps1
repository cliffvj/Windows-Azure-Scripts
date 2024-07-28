# Create a firewall rule to allow use of the application that uses the application.exe
New-NetFirewallRule -DisplayName “Allow Inbound Application” -Direction Inbound -Program %SystemRoot%\System32\application.exe -RemoteAddress LocalSubnet -Action Allow

# Modify an existing rule
Set-NetFirewallRule –DisplayName “Allow Web 80” -RemoteAddress 192.168.0.2

# Delete an existing rule
Remove-NetFirewallRule –DisplayName “Allow Web 80”
