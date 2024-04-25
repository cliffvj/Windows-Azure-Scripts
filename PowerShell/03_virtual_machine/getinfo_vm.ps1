$vm_name = 'vm'
$rg_name = 'rg_new'

# Get all Azure VMs
Get-AzVM

# Get VMs specific to a Resource Group
# Get-AzVM  -Name vm1 -ResourceGroupName rg_new

# Save info to a variable $vm
# Get-AzVM  -Name vm1 -ResourceGroupName rg_new

# Get all information
# $vm

# Get VmSize
#$vm.HardwareProfile.VmSize

# Get NetworkInterfaces
#$vm.NetworkProfile

# Get {ComputerName, AdminUsername, WindowsConfiguration, Secrets, AllowExtensionOperations, RequireGuestProvisionSignal}
#$vm.OSProfile

# Get {ImageReference, OsDisk, DataDisks, DiskControllerType}
#$vm.StorageProfile