# Install all RSAT features
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
