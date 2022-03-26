# WazuhPermOwnVerifier


In case of system/server failures or kernel upgrades, the permissions/ownership of installed tools could be modified and should be reverted back to previous state.

The WazuhPermOwnVerifier allows verifying the needed permissions/ownership that a Wazuh manager should have to work as intended.


# How to use it

1 - Clone the repo 

2 - Run the script with the corresponding Wazuh version: `bash verify-manager-permOwner wazuh-4.2.5-PO`
