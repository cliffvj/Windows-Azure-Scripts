# Disable Nested Virtualization
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $false
