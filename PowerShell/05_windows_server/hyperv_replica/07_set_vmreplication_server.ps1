# Enable this computer as a Replica server. 

# Automatically creates the folder to store the replica files indicated if not yet created
Set-VMReplicationServer -ReplicationEnabled $true -AllowedAuthenticationType Kerberos -KerberosAuthenticationPort 80 `
  -ReplicationAllowedFromAnyServer $true -DefaultStorageLocation C:\ReplicaStorage

# Verify the configuration of the Replica server
Get-VMReplicationServer
