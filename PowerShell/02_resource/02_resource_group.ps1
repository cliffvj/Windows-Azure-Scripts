# Get list of Resource Group
Get-AzResourceGroup
# Or formatted
Get-AzResourceGroup | Format-Table

# Create a new Resource Group
$rg = New-AzResourceGroup -Name "rg_0419-1" -Location "eastus"


# Create a resource group using hash table.
$rg2 = @{
    Name = "rg_0419-2"
    Location = "eastus2"
}

# New-AzResourceGroup @rg2
# Or to reassign to the same variable
$rg2 = New-AzResourceGroup @rg2


# List all you Azure Resources
Get-AzResource

# Filter by specific Resource Group, e.g. rg_new
Get-AzResource -ResourceGroupName $rg.ResourceGroupName

# Delete a specific Resource Group
Remove-AzResourceGroup -Name $rg.ResourceGroupName