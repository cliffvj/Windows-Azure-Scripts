$vnet = Get-AzVirtualNetwork -Name "vnet-1" -ResourceGroupName "test-rg"
$subnet = Get-AzVirtualNetworkSubnetConfig -Name "subnet-1" -VirtualNetwork $vnet
$nic = Get-AzNetworkInterface -Name "nic-1" -ResourceGroupName "test-rg"
$pip = Get-AzPublicIpAddress -Name "myStandardPublicIP" -ResourceGroupName "test-rg"
$nic | Set-AzNetworkInterfaceIpConfig -Name ipconfig1 -PublicIPAddress $pip -Subnet $subnet
$nic | Set-AzNetworkInterface