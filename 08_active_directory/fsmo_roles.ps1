# Locate the domain and forest specific FSMO roles
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster

# To move the FSMO roles to a new domain controller
Move-ADDirectoryServerOperationMasterRole -Identity TargetDC `
  -OperationMasterRole SchemaMaster, DomainNamingMaster, PDCEmulator, RIDMaster, InfrastructureMaster
