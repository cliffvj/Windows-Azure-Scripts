# Decrypt Sysinternals Remote Desktop Connection Manager Login Credentials Password

# Open saved *rdg file with any text editor
# Copy text between <password> and </password> tags
$PwdString = "SamplePassword1234"

# Copy-Item '\Path\RDCMan.exe' '\Path\RDCMan.dll'
Copy-Item 'C:\Sysinternals\RDCMan.exe' 'C:\Sysinternals\RDCMan.dll'

# Use the dll location
Import-Module 'C:\Sysinternals\RDCMan.dll'
$EncryptionSettings = New-Object -TypeName RdcMan.EncryptionSettings
[RdcMan.Encryption]::DecryptString($PwdString, $EncryptionSettings)


Read-Host "Press Enter to exit"
