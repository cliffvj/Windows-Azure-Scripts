# Reference PowerShell\03_virtual_network\create_vnet.ps1 for vnet creation.

# Set the administrator and password for the VM.
$cred = Get-Credential

# Place the virtual network into a variable.
$vnet = Get-AzVirtualNetwork -Name 'vnet-1' -ResourceGroupName 'test-rg'

# Create a network interface for the VM.
$nic = @{
    Name = "nic-1"
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    Subnet = $vnet.Subnets[0]
}
$nicVM = New-AzNetworkInterface @nic

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
$vmConfig = New-AzVMConfig @vmsz | Set-AzVMOperatingSystem @vmos -Linux | Set-AzVMSourceImage @vmimage | Add-AzVMNetworkInterface -Id $nicVM.Id

# Create the VM.
$vm = @{
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    VM = $vmConfig
}
New-AzVM @vm