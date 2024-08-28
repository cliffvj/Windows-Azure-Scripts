# Test failover of VM in Replica server

$vm = "VM1"
$primary = "Server1.mydomain.com"
$replica = "Server2.mydomain.com"

# Initiate a test failover of the virtual machine in $replica.
Start-VMFailover -VMName $vm -ComputerName $replica -AsTest
