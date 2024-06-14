$Session = New-PSSession -ComputerName 'DC01'

Invoke-Command -Session $Session -ScriptBlock {Get-TimeZone}
