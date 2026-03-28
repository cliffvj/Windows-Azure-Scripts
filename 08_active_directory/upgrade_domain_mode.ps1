# Upgrade domain mode or functional level.

# To get current mode
# Get-ADDomain | Select-Object DomainMode

Set-ADDomainMode -identity MyDomain.com -DomainMode Windows2016Domain
