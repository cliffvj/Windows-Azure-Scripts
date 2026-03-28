# Install AD DS and Configure Forest

$ProgressPreference = "SilentlyContinue"
$WarningPreference = "SilentlyContinue"
Install-WindowsFeature "AD-Domain-Services" -IncludeManagementTools | Out-Null
$pw = ConvertTo-SecureString "P@$$w0rd" -AsPlainText -Force
Install-ADDSForest -DomainName "corp.mydomain.com" -SafeModeAdministratorPassword $pw -DomainNetbiosName 'CORP' -InstallDns -Force -NoRebootOnCompletion
