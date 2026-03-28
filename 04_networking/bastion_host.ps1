# Virtual network $virtualNetwork creation under PowerShell\03_virtual_network\create_vnet.ps1
# Disregard this if already created
$vnet = @{
    Name = 'vnet-1'
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    AddressPrefix = '10.0.0.0/16'
}
$virtualNetwork = New-AzVirtualNetwork @vnet

# Configure Bastion Subnet and must be named AzureBastionSubnet
$subnet = @{
    Name = 'AzureBastionSubnet'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.1.0/26'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

# Associate subnet configuration to the virtual network
$virtualNetwork | Set-AzVirtualNetwork

# Create a public IP address for Bastion. The Bastion host uses the public IP to access SSH and RDP over port 443.
$ip = @{
    ResourceGroupName = 'test-rg'
    Name = 'public-ip'
    Location = 'eastus2'
    AllocationMethod = 'Static'
    Sku = 'Standard'
    Zone = 1,2,3
}
New-AzPublicIpAddress @ip

# Use the New-AzBastion command to create a new Standard SKU Bastion host in AzureBastionSubnet
$bastion = @{
    Name = 'bastion'
    ResourceGroupName = 'test-rg'
    PublicIpAddressRgName = 'test-rg'
    PublicIpAddressName = 'public-ip'
    VirtualNetworkRgName = 'test-rg'
    VirtualNetworkName = 'vnet-1'
    Sku = 'Basic'
}
New-AzBastion @bastion