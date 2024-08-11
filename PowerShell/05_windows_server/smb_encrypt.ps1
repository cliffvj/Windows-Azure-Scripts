# SMB encryption on SMB shares

# Enable SMB encryption on an existing file share
Set-SmbShare –Name <sharename> -EncryptData $true

# Encrypt all shares on a file server
Set-SmbServerConfiguration –EncryptData $true

# Create a new SMB file share on a server and enable SMB encryption at the same time
New-SmbShare –Name <sharename> -Path <pathname> –EncryptData $true

# Reference
# https://learn.microsoft.com/en-us/training/modules/harden-windows-server/6-secure-smb-traffic
