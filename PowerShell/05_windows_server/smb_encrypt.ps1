# SMB encryption on SMB shares

# Enable SMB encryption on an existing file share
Set-SmbShare –Name <sharename> -EncryptData $true

# Encrypt all shares on a file server
Set-SmbServerConfiguration –EncryptData $true
