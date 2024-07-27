# Install Azure Monitor Agent
# https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-manage?tabs=azure-cli

# On an Azure VM with a User-assigned managed identity.
az vm extension set --name AzureMonitorWindowsAgent --publisher Microsoft.Azure.Monitor --ids <vm-resource-id> --enable-auto-upgrade true --settings '{"authentication":{"managedIdentity":{"identifier-name":"mi_res_id","identifier-value":"/subscriptions/<my-subscription-id>/resourceGroups/<my-resource-group>/providers/Microsoft.ManagedIdentity/userAssignedIdentities/<my-user-assigned-identity>"}}}'

# On an Azure VM with a System-assigned managed identity.
az vm extension set --name AzureMonitorWindowsAgent --publisher Microsoft.Azure.Monitor --ids <vm-resource-id> --enable-auto-upgrade true

# On an Azure Arc-enabled servers.
az connectedmachine extension create --name AzureMonitorWindowsAgent --publisher Microsoft.Azure.Monitor --type AzureMonitorWindowsAgent --machine-name <arc-server-name> --resource-group <resource-group-name> --location <arc-server-location> --enable-auto-upgrade true
