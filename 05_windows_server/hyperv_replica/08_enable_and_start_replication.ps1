# Enable, start and identify replication of virtual machine

$vm = "VM1"
$primary = "Server1.mydomain.com"
$replica = "Server2.mydomain.com"
$port = 80

# Enable replication. State after running is "ReadyForInitialReplication"
Enable-VMReplication VM1 -ReplicaServerName $replica -ReplicaServerPort $port -AuthenticationType Kerberos -ComputerName $primary

# Start replication. State after running is "Replicating" or "Replication enabled" in Hyper-V Manager
Start-VMInitialReplication VM

# Identify the status of the replicaiton
Get-VMReplication
