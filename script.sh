#!/usr/bin/env bash

### ANSI escape colour codes
blue="\u001b[36m"
reset_colour="\u001b[0m"

### Sources
source ./sources/disks.sh
source ./sources/displays.sh
source ./sources/locale.sh
source ./sources/memory.sh
source ./sources/packages.sh
source ./sources/quick_queries.sh
source ./sources/uptime.sh
source ./sources/window_manager.sh





### Output
printf "${blue}$USER${reset_colour}@${blue}$HOSTNAME${reset_colour}\n"
printf -- "------------------\n"
printf "${blue}OS:${reset_colour} $os_version\n"
printf "${blue}Kernel:${reset_colour} $kernel_version\n"
printf "${blue}Bootloader:${reset_colour} $boot_manager\n"

# Display output for all active monitors
for i in "${!monitor_names[@]}"
do
    monitor_current_name="${monitor_names[$i]}"
    monitor_current_resolution="${monitor_resolutions[$i]}"

    printf "${blue}Display (%s):${reset_colour} %s\n" "$monitor_current_name" "$monitor_current_resolution"
done

printf "${blue}CPU:${reset_colour} ${cpu_model} (${cpu_amount}) @ ${cpu_speed_ghz} (${cpu_usage} %%)\n"
printf "${blue}GPU:${reset_colour} ${gpu_manufacturer} ${gpu_model}\n"
printf "${blue}Memory:${reset_colour} ${mem_used_gib} GiB / ${mem_total_gib} GiB (${mem_usage} %%)\n"
printf "${blue}Swap:${reset_colour} ${swap_output}"
printf "${blue}Disk (/):${reset_colour} ${disk_root_used_gib} GiB / ${disk_root_total_gib} GiB ($disk_root_usage %%)\n"
printf "$disk_home_output"

printf "\n"

printf "${blue}Uptime:${reset_colour} ${uptime_output}\n"
printf "${blue}Packages:${reset_colour} ${packages_pacman} (pacman)${packages_flatpak_output}\n"
printf "${blue}Shell:${reset_colour} ${shell}\n"
printf "${blue}Window Manager:${reset_colour} ${wm_output}\n"
printf "${blue}Locale:${reset_colour} ${locale_output}\n"

printf "\n"

printf "${blue}Local IP:${reset_colour} ${ip_local}\n"
printf "${blue}Public IP:${reset_colour} ${ip_public}\n"