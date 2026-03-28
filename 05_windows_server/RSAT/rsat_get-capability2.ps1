# List all RSAT features and the installed state using Name (capability name) which is used when adding (installing) the tool
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property Name, State

# The output would be
#
# Name                                                          State
# ----                                                          -----
# Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0              Installed
# Rsat.AzureStack.HCI.Management.Tools~~~~0.0.1.0          NotPresent
# Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0                  Installed
# Rsat.CertificateServices.Tools~~~~0.0.1.0                 Installed
# Rsat.DHCP.Tools~~~~0.0.1.0                                Installed
# Rsat.Dns.Tools~~~~0.0.1.0                                 Installed
# Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0          Installed
# Rsat.FileServices.Tools~~~~0.0.1.0                        Installed
# Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0              Installed
# Rsat.IPAM.Client.Tools~~~~0.0.1.0                         Installed
# Rsat.LLDP.Tools~~~~0.0.1.0                               NotPresent
# Rsat.NetworkController.Tools~~~~0.0.1.0                  NotPresent
# Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0                Installed
# Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0             Installed
# Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0              Installed
# Rsat.ServerManager.Tools~~~~0.0.1.0                       Installed
# Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0  Installed
# Rsat.StorageReplica.Tools~~~~0.0.1.0                     NotPresent
# Rsat.SystemInsights.Management.Tools~~~~0.0.1.0          NotPresent
# Rsat.VolumeActivation.Tools~~~~0.0.1.0                   NotPresent
# Rsat.WSUS.Tools~~~~0.0.1.0                                Installed
