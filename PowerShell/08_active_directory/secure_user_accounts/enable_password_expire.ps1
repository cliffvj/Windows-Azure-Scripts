# Locate non-expiring user
Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $true}

# Enable password expiration for all the result set
Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $true} | Set-ADUser -PasswordNeverExpires $false
