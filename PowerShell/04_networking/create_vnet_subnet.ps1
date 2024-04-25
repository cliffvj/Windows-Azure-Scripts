$rg = @{
    Name = 'test-rg'
    Location = 'eastus2'
}
New-AzResourceGroup @rg

# Virtual Network
$vnet = @{
    Name = 'vnet-1'
    ResourceGroupName = $rg.Name
    Location = $rg.Location
    AddressPrefix = '10.0.0.0/16'
}
$virtualNetwork = New-AzVirtualNetwork @vnet

# Subnet
$subnet = @{
    Name = 'subnet-1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.0.0/24'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

# Associate subnet configuration to the virtual network
$virtualNetwork | Set-AzVirtualNetwork