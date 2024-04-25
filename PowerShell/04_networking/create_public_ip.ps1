# $rg =@{
#     Name = 'test-rg'
#     Location = 'eastus2'
# }
# New-AzResourceGroup @rg

$ip = @{
    Name = 'myStandardPublicIP'
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    Sku = 'Standard' # Or 'Basic' 
    AllocationMethod = 'Static'
    IpAddressVersion = 'IPv4'
    #Zone = 1,2,3 # Omit Zone if Standard with no-zone OR if Sku is Basic OR Global Tier
    # By default, routing reference for public IP is set to Microsoft network. 
    # Uncomment if tier is set to global that is Ip address spans across multiple regions.
    # Tier = 'Global' 
}

New-AzPublicIpAddress @ip