# Using local template -TemplateFile
# Using Remote template -TemplateUri

New-AzResourceGroupDeployment -ResourceGroupName <resource-group-name> -TemplateFile <path-to-template>

New-AzSubscriptionDeployment -Location <location> -TemplateFile <path-to-template>

New-AzManagementGroupDeployment -Location <location> -TemplateFile <path-to-template>

New-AzTenantDeployment -Location <location> -TemplateFile <path-to-template>

