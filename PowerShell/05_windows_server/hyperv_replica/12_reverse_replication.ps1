# Starts $vm that has been switched from a Replica virtual machine to a primary virtual machine.
# Applicable to a currently running planned or failover.

$vm = "VM1"
$new_primary = "Server2.mydomain.com"

Set-VMReplication -Reverse -VMName $vm -ComputerName $new_primary
