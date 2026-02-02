#!/usr/bin/env bash

# quick info queries
os_version="$(cat /etc/os-release | cut -d\" -f2 | head -1)" # os version
kernel_version="$(uname -r)" # kernel version


# find out the Boot Manager
# boot_version_current="$(cat e)"




# Output
echo ""
echo "$USER@$HOSTNAME"
echo "------------------"
echo "OS: $os_version"
echo "Kernel: $kernel_version"
echo ""
echo ""