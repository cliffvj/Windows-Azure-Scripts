# Enable Nested Virtualization
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true
