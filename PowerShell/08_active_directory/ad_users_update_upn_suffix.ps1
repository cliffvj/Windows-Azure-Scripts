# Import the Active Directory PowerShell Module
Import-Module ActiveDirectory

# Get all the users from the Domain
$Users = Get-ADUser -Filter *

# Update all of the users with the new UPN suffix
for each ($User in $Users) {
  Set-ADUser -Identity $User -UserPrincipalName "$($User.SamAccountName)@cliffordjuan.com"
}
