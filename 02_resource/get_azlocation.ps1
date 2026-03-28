# View all locations
Get-AzLocation | Format-Table Location, DisplayName -AutoSize | Out-File -FilePath .\AZLocations.txt