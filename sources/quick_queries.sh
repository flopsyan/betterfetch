#!/usr/bin/env bash

# OS version
os_version="$(cat /etc/os-release | cut -d\" -f2 | head -1)"


# Kernel version
kernel_version="$(uname -r)"


# Boot Manager
boot_current="$(efibootmgr -v | cut -d' ' -f2 | head -1)"
boot_manager="$(efibootmgr -v | grep "Boot${boot_current}" | awk '{print $2}')"