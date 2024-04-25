# Create an Azure Virtual Machine
New-AzVM `
-Name "vm-centos85" `
-ResourceGroupName "rg_centos85" `
-Location "eastus" -Credential (Get-Credential) `
-Image "CentOS85Gen2" `
-Size "Standard_B1s"