# Planned failover of VM to Replica server

$vm = "VM1"
$primary = "Server1.mydomain.com"
$replica = "Server2.mydomain.com"

# Prepares for the planned failover of $vm by replicating any pending changes.
Start-VMFailover -Prepare -VMName $vm -ComputerName $primary

# Initiate a failover of the virtual machine to $replica.
Start-VMFailover -VMName $vm -ComputerName $replica
