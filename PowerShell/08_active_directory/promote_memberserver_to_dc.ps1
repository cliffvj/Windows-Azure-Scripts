# Prepare the forest and domain before promoting a member server to Domain Controller.
# To prepare the forest, run:
# Adprep /forestprep
# To prepare each domain in the AD DS forest, run:
# Adprep /domainprep
# Once you have performed the forest and domain preparation steps and replication has occurred across your forest, 
# you can promote the Windows Server 2022 member server to domain controller.

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

Install-ADDSDomainController -CreateDnsDelegation:$false -InstallDns:$true -DomainName "MyDomain.com" -SiteName "Default-First-Site-Name" -ReplicationSourceDC "DC01.MyDomain.com" -DatabasePath "C:\Windows\NTDS" -LogPath "C:\Windows\NTDS" -SysvolPath "C:\Windows\SYSVOL" -Force:$true
