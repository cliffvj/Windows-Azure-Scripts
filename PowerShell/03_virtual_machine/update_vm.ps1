$vm_name = 'vm'
$rg_name = 'rg_new'
$vm = Get-AzVM  -Name $vm_name -ResourceGroupName $rg_name
$vm.HardwareProfile.vmSize = "Standard_DS3_v2"

Update-AzVM -ResourceGroupName $rg_name  -VM $vm