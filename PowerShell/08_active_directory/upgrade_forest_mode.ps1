# Upgrade forest mode or functional level.

# To get current mode
# Get-ADForest | Select-Object ForestMode

Set-ADForestMode -Identity MyDomain.com -ForestMode Windows2016Forest
