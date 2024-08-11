# Locate problematic accounts

# Find active users with passwords set to never expire
Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $true}

# Find users that have not signed in within the last n days
$n = 90
Get-ADUser -Filter {LastLogonTimeStamp -lt (Get-Date).Adddays(-($n))-and enabled -eq $true} -Properties LastLogonTimeStamp
