# Create a new Resource Group
$rg_name = "rg_production"
$rg_location = "eastus"
$vnet_name = "vnet-1"
$subnet_name = "subnet-1"

$rg = New-AzResourceGroup -Name $rg_name -Location $rg_location

# Virtual Network
$vnet = @{
    Name = $vnet_name
    ResourceGroupName = $rg_name
    Location = $rg_location
    AddressPrefix = '10.0.0.0/16'
}
$vnet = New-AzVirtualNetwork @vnet

# Subnet
$subnet = @{
    Name = $subnet_name
    VirtualNetwork = $vnet
    AddressPrefix = '10.0.0.0/24'
}

Add-AzVirtualNetworkSubnetConfig @subnet

# Associate subnet configuration to the virtual network
$vnet = $vnet | Set-AzVirtualNetwork

# subnet
$subnet = $vnet.Subnets[0]

# Create a network interface for the VM.
$nic = @{
    Name = "nic-1"
    ResourceGroupName = $rg_name
    Location = $rg_location
    Subnet = $subnet
}
$nic = New-AzNetworkInterface @nic

# Create Public IP Address
$ip = @{
    Name = 'myStandardPublicIP'
    ResourceGroupName = $rg_name
    Location = $rg_location
    Sku = 'Standard' 
    AllocationMethod = 'Static'
    IpAddressVersion = 'IPv4'
}

$pip = New-AzPublicIpAddress @ip

$nic | Set-AzNetworkInterfaceIpConfig -Name "ipconfig1" -PublicIPAddress $pip -Subnet $subnet
$nic | Set-AzNetworkInterface

# Create new Network Security Group (NSG)
$nsg = New-AzNetworkSecurityGroup -Name "nsg1" -ResourceGroupName $rg_name -Location $rg_location

# Create NSG allow rules
$nsg | Add-AzNetworkSecurityRuleConfig -Name "allow_ssh" -Description "allow_ssh" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 22 | Set-AzNetworkSecurityGroup
$nsg | Add-AzNetworkSecurityRuleConfig -Name "allow_http" -Description "allow_http" -Access Allow -Protocol Tcp -Direction Inbound -Priority 200 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80 | Set-AzNetworkSecurityGroup
$nsg | Add-AzNetworkSecurityRuleConfig -Name "allow_https" -Description "allow_https" -Access Allow -Protocol Tcp -Direction Inbound -Priority 300 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 443 | Set-AzNetworkSecurityGroup

# Associate NSG with the subnet and to the virtual network
$subnet.NetworkSecurityGroup = $nsg
Set-AzVirtualNetwork -VirtualNetwork $vnet

# Set the administrator and password for the VM.
$cred = Get-Credential

# Create a virtual machine configuration.
$vmsz = @{
    VMName = "vm-1"
    VMSize = 'Standard_B1s'  
}
$vmos = @{
    ComputerName = "vm-1"
    Credential = $cred
}
$vmimage = @{
    PublisherName = 'Canonical'
    Offer = '0001-com-ubuntu-server-jammy'
    Skus = '22_04-lts-gen2'
    Version = 'latest'    
}
$vmConfig = New-AzVMConfig @vmsz | Set-AzVMOperatingSystem @vmos -Linux | Set-AzVMSourceImage @vmimage | Add-AzVMNetworkInterface -Id $nic.Id

# Create the VM.
$vm = @{
    ResourceGroupName = $rg_name
    Location = $rg_location
    VM = $vmConfig
}
New-AzVM @vm