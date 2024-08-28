# Cancel planned or test failover and resume replication after. Run on the Replica server.

$vm = "VM1"

Stop-VMFailover -VMName $vm
Resume-VMReplication -VMName $vm
