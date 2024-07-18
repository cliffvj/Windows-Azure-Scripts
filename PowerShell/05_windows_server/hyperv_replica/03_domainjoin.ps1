# Join computer corp.mydomain.com domain

$pw = 'P@$$w0rd'

$joinCred = New-Object pscredential -ArgumentList ([pscustomobject]@{
    UserName = "CORP\labadmin"
    Password = (ConvertTo-SecureString -String $pw -AsPlainText -Force)[0]
})
Add-Computer -Domain "corp.mydomain.com" -Credential $joinCred
