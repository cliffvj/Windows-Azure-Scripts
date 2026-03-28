# Connect to an Azure account
Connect-AzAccount

# If connection failed
Connect-AzAccount -UseDeviceAuthentication

# Check active subscription
Get-AzContext

# Get a list of subscriptions
Get-AzSubscription

# Change the subscription
Set-AzContext -Subscription '00000000-0000-0000-0000-000000000000'

