# Identify the status of Windows Defender Firewall with Advanced Security rule
Get-NetFirewallRule -DisplayName 'Hyper-V Replica HTTP Listener (TCP-In)'

# Enable the rule if needed
Enable-NetFirewallRule -DisplayName 'Hyper-V Replica HTTP Listener (TCP-In)'
