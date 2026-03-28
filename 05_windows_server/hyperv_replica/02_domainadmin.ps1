# Create Domain Admin

$pw = ConvertTo-SecureString "P@$$w0rd" -AsPlainText -Force
New-ADUser -Name "labadmin" -Description "Lab Domain Admin" -Enabled $true -AccountPassword $pw
Add-ADGroupMember -Identity "Domain Admins" -Members labadmin
