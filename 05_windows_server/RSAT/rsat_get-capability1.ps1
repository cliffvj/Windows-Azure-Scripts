# List all RSAT features and the installed state using DisplayName
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

# The output would be
#
# DisplayName                                                                          State
# -----------                                                                          -----
# RSAT: Active Directory Domain Services and Lightweight Directory Services Tools  Installed
# RSAT: PowerShell module for Azure Stack HCI                                     NotPresent
# RSAT: BitLocker Drive Encryption Administration Utilities                        Installed
# RSAT: Active Directory Certificate Services Tools                                Installed
# RSAT: DHCP Server Tools                                                          Installed
# RSAT: DNS Server Tools                                                           Installed
# RSAT: Failover Clustering Tools                                                  Installed
# RSAT: File Services Tools                                                        Installed
# RSAT: Group Policy Management Tools                                              Installed
# RSAT: IP Address Management (IPAM) Client                                        Installed
# RSAT: Data Center Bridging LLDP Tools                                           NotPresent
# RSAT: Network Controller Management Tools                                       NotPresent
# RSAT: Network Load Balancing Tools                                               Installed
# RSAT: Remote Access Management Tools                                             Installed
# RSAT: Remote Desktop Services Tools                                              Installed
# RSAT: Server Manager                                                             Installed
# RSAT: Storage Migration Service Management Tools                                 Installed
# RSAT: Storage Replica Module for Windows PowerShell                             NotPresent
# RSAT: System Insights Module for Windows PowerShell                             NotPresent
# RSAT: Volume Activation Tools                                                   NotPresent
# RSAT: Windows Server Update Services Tools                                       Installed
