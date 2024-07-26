### Snapshot an Azure VM Disk - from A CLOUD GURU Lab


# Stop the Virtual Machine
# ------------------------
## Use the correct PowerShell command to stop and deallocate the VM that's provisioned with this lab.
## In the Azure Portal, click All resources and copy the name of the pre-provisioned resource group.

## In the Cloud Shell, create a new variable:
$rg = "<RESOURCE_GROUP_NAME>"

## In the Azure Portal, copy the name of the VM disk and create a new variable:
$diskname = "<VIRTUAL_MACHINE_DISK_NAME>"

## Create a variable for sasExpiryDuration:
$sasExpiryDuration = "3600"

## In the Azure Portal, copy the storage account name, and create a new variable:
$storageAccountName = "<STORAGE_ACCOUNT_NAME>"

## In the Azure Portal, copy the storage account key for key1, and create a new variable:
$storageAccountKey = "<KEY1_STORAGE_ACCOUNT_KEY>"

## Create additional variables:
$storageContainerName = "container1"
$destinationVHDFileName = "disk1.vhd"
$useAzCopy = 1
$vmName = "winVM"

## Stop the VM:
Stop-AzVM -ResourceGroupName $rg -Name $vmName


# Take a Snapshot of the VM
# -------------------------
## Use the appropriate commands to take a snapshot of the VM.

## Once the VM has stopped, grant access to the disk:
$sas = Grant-AzDiskAccess -ResourceGroupName $rg -DiskName $diskName -DurationInSecond $sasExpiryDuration -Access Read

## Create an Azure Storage context:
$destinationContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

## Copy the Snapshot to Container

##Using AzCopy, send the snapshot to the container1 within the storage account provisioned with this lab.
## Using AzCopy, send the snapshot to container1:
if($useAzCopy -eq 1)
{
$containerSASURI = New-AzStorageContainerSASToken -Context $destinationContext -ExpiryTime(get-date).AddSeconds($sasExpiryDuration) -FullUri -Name $storageContainerName -Permission rw
azcopy copy $sas.AccessSAS $containerSASURI

}else{

Start-AzStorageBlobCopy -AbsoluteUri $sas.AccessSAS -DestContainer $storageContainerName -DestContext $destinationContext -DestBlob $destinationVHDFileName
}
## the end
