#!/usr/bin/env bash

# OS version
os_version="$(cat /etc/os-release | cut -d\" -f2 | head -1) $(uname -m) ($(uname -o))"


# Kernel version
kernel_version="$(uname -s) $(uname -r)"


# Boot Manager
boot_current="$(efibootmgr -v | cut -d' ' -f2 | head -n 1)"
boot_manager="$(efibootmgr -v | grep "Boot${boot_current}" | awk '{print $2}')"


# CPU
cpu_model="$(lscpu | grep "Model name:" | xargs | cut -d: -f2 | xargs)"
cpu_amount="$(lscpu | grep "CPU(s):" | head -n 1 | xargs | cut -d: -f2 | xargs)"
cpu_speed_mhz="$(lscpu | grep "CPU max MHz:" | xargs | cut -d: -f2 | xargs | cut -d, -f1)"
cpu_speed_ghz="$(awk "BEGIN {printf \"%.2f\", ${cpu_speed_mhz} / 1000}")"
cpu_usage="$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%.2f", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')"


# GPU
gpu_manufacturer="$(lspci | grep -iE "VGA|3D|Video" | cut -d':' -f3 | cut -d'[' -f1 | xargs)"
gpu_model="$(lspci | grep -iE "VGA|3D|Video" | cut -d'[' -f3 | cut -d']' -f1)"


# Current Shell
shell="$(sh -c 'ps -p $$ -o ppid=' | xargs ps -o comm= -p)"