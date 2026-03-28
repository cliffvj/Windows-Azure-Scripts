# Demote AD Domain Controller
# Last DC in domain

Import-Module ADDSDeployment
Uninstall-ADDSDomainController `
-DemoteOperationMasterRole:$true `
-IgnoreLastDnsServerForZone:$true `
-LastDomainControllerInDomain:$true `
-RemoveDnsDelegation:$true `
-IgnoreLastDCInDomainMismatch:$true `
-Force:$true
