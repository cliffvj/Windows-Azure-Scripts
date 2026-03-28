# Change value for the desired VmName $vm_name ResourceGroupName $rg_name
$vm_name = 'vm'
$rg_name = 'rg_new'

# Delete an Azure VM
$vm = Remove-AzVM -Name $vm_name -ResourceGroupName $rg_name

# Delete the network interface
$vm | Remove-AzNetworkInterface -Force

# Delete the managed OS disks
Get-AzDisk -ResourceGroupName $rg_name -DiskName $vm.StorageProfile.OSDisk.Name | Remove-AzDisk -Force

# Delete the virtual network
Get-AzVirtualNetwork -ResourceGroupName $rg_name | Remove-AzVirtualNetwork -Force

# Delete the network security group
Get-AzNetworkSecurityGroup -ResourceGroupName $rg_name | Remove-AzNetworkSecurityGroup -Force

# Delete the IP Public Address
Get-AzPublicIpAddress -ResourceGroupName $rg_name | Remove-AzPublicIpAddress -Force