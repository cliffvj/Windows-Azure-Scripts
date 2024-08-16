# Create an AD User and assign to a group

# Set variables here
$username = "newusername"
$udescription = "New user description"
$groupname = "GroupName e.g. *Domain Admins, Sales"
$saname = "SamAccountName e.g. Sales"
$groupcat = "Group Category [Security, Distribution]"
$gscope = "Group Scope [Domain local, Global, Universal]
$gdisplay = "Display Name (Group) e.g. Sales Team"
$gpath = "CN=Users,DC=corp,DC=domain,DC=com"
$gdescription = "Members of the Sales Team"

# Create AD User - username, description, and password are prompted 
New-ADUser $username `
-Description $udescription `
-Enabled $true `
-AccountPassword (Read-Host -Prompt "Provide Password" -AsSecureString)

# Create $groupname group and add $username user
New-ADGroup -Name $groupname -SamAccountName $saname `
-GroupCategory $groupcat `
-GroupScope $gscope `
-DisplayName $gdisplay `
-Path $gpath `
-Description $gdescription

Add-ADGroupMember -Identity $gname -Members $username
