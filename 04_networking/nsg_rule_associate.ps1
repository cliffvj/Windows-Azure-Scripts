# Create new Network Security Group (NSG)
$nsg = New-AzNetworkSecurityGroup -Name "nsg1" -ResourceGroupName "test-rg" -Location "eastus2"

# Create NSG allow rules
$nsg | Add-AzNetworkSecurityRuleConfig -Name "allow_ssh" -Description "allow_ssh" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 22 | Set-AzNetworkSecurityGroup
$nsg | Add-AzNetworkSecurityRuleConfig -Name "allow_http" -Description "allow_http" -Access Allow -Protocol Tcp -Direction Inbound -Priority 200 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80 | Set-AzNetworkSecurityGroup
$nsg | Add-AzNetworkSecurityRuleConfig -Name "allow_https" -Description "allow_https" -Access Allow -Protocol Tcp -Direction Inbound -Priority 300 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 443 | Set-AzNetworkSecurityGroup

# Associate NSG with the subnet
$vnet = Get-AzVirtualNetwork -Name "vnet-1" -ResourceGroupName "test-rg"
$subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name "subnet-1"
$subnet.NetworkSecurityGroup = $nsg
Set-AzVirtualNetwork -VirtualNetwork $vnet