$vm_name = 'vm'
$rg_name = 'rg_new'

# Starts a stopped VM
Start-AzVM -Name $vm_name -ResourceGroupName $rg_name

# Stops a running VM
Stop-AzVM -Name $vm_name -ResourceGroupName $rg_name

# Restarts a VM
Restart-AzVM -Name $vm_name -ResourceGroupName $rg_name