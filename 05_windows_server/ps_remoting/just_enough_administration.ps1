# Login to DC, setup JEA for a group, say 'Helpdesk Admins'. Check for their group member.
Get-ADGroupMember 'Helpdesk Admins' | Select-Object Name

# Check env for the PSModulePath
$env:PSModulePath

# Change directory of one of the path in the $env variable
Set-Location C:\Windows\system32\WindowsPowerShell\v1.0\Modules

# Create a folder and enter for our JEA session configuration
New-Item -Name HelpdeskAdmin -ItemType Directory
Set-Location .\HelpdeskAdmin\

# Create a PowerShell module.
New-ModuleManifest -Path .\He1pdesk.psd1

# Configure the ROLE capabilities.
New-Item -Name RoleCapabilities -ItemType Directory
Set-Location .\RoleCapabilities\
New-PSRoleCapabi1ityFi1e -Path .\He1pdesk.psrc
#
# Edit .\Helpdesk.psrc file using PowerShell ISE
ise .\Helpdesk.psrc
# From the opened file, uncomment ModuleToImport and specify you own list of module after the "=" sign, example below:
# ModulesToImport = 'ActiveDirectory', 'DNSServer'
# Check CommandType you'd like to implement
# {Get-Command Clear-DnsServerCache} will show Function, thus VisibleFunctions = 'Clear-DNSServerCache'
# {Get-Command Unlock-ADAccount} will show Cmdlet, thus VisibleCmdlets = 'Unlock-ADAccount'

# Configure the session configuration. Define WHO can do the role
New-PSSessionConfigurationFi1e -Path .\He1pdesk.pssc
# Edit .\Helpdesk.pssc file using PowerShell ISE
# Change the session type to restricted remote server:
# SessionType = 'RestrictedRemoteServer'
# RunAsVirtualAccount = $true
# RoleDefinitions = @{CORP\Helpdesk Admins' = @RoleCapabilities = 'HelpdeskAdmin' }};

# Register the session configuration.
Register-PSSessionConfiguration -Path .\He1pdesk.pssc

# Restart the Windows Remote Management Service
Restart-Service WinRM

# Login as a user of the Helpdesk Admin into an Admin PC, Enter-PSSession to a DC
Enter-PSSession -ComputerName DC01 -ConfigurationName HelpdeskAdmin
# List commands available to the user at the current session.
Get-Command
