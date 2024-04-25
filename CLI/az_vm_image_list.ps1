# List Azure VM Image listing
az vm image list --offer "CentOS" --all

# Shorten with --publisher, --offer, --sku , --version, add --all to retrive an up-to-date list
# az vm image list --publisher "RedHat"
# az vm image list --publisher "Canonical
# az vm image list --offer "WindowsServer"
# az vm image list --offer "RHEL"
# az vm image list --offer "CentOS"

# Website easy reference for list of 
# https://az-vm-image.info/