# Find users that have not signed in within the last n days
$n = 90
Get-ADUser -Filter {LastLogonTimeStamp -lt (Get-Date).Adddays(-($n))-and enabled -eq $true} -Properties LastLogonTimeStamp

# Disable the account using the result set
# Get-ADUser -Filter {LastLogonTimeStamp -lt (Get-Date).Adddays(-($n))-and enabled -eq $true} -Properties LastLogonTimeStamp | Disable-ADAccount
