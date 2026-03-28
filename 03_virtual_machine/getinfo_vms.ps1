# Get all Azure Subscriptions
$subscriptions = Get-AzSubscription

# Initialize an empty array to store VM information
$vm_info = @()

# Loop through each subscription
foreach ($subscription in $subscriptions) {
    # Set the current subscription context
    Set-AzContext -Subscription $subscription

    # Get all Azure Virtual Machines in the current subscription
    $vms = Get-AzVM

    # Loop through each VM in the current subscription
    foreach ($vm in $vms) {
        $vm_name = $vm.Name
        $resource_group_name = $vm.ResourceGroupName
        $location = $vm.Location
        $vm_size = $vm.HardwareProfile.VmSize
        $os_type = $vm.StorageProfile.OsDisk.OsType
        $os_version = $vm.StorageProfile.OsDisk.OsVersion

        # Get the IP addresses of the VM
        $network_interfaces = Get-AzNetworkInterface
        $ip_addresses = $network_interfaces.IpConfigurations.PrivateIpAddress

        # Create an object to store VM information
        $vm_object = [PSCustomObject]@{
            'SubscriptionName' = $subscription.Name
            'VMName' = $vm_name
            'ResourceGroupName' = $resource_group_name
            'Location' = $location
            'VMSize' = $vm_size
            'OSType' = $os_type
            'OSVersion' = $os_version
            'IPAddresses' = $ip_addresses -join ', '
        }

        # Add the VM information object to the array
        $vm_info += $vm_object
    }
}

$vm_info | Format-Table -AutoSize | Out-File -FilePath .\vm_info.txt