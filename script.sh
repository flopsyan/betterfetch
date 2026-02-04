#!/usr/bin/env bash

# sources
source ./sources/disks.sh
source ./sources/displays.sh
source ./sources/memory.sh
source ./sources/quick_queries.sh
source ./sources/uptime.sh


# ANSI escape colour codes
blue="\u001b[36m"
reset_colour="\u001b[0m"





# Output
printf "\n"
printf "${blue}$USER${reset_colour}@${blue}$HOSTNAME${reset_colour}\n"
printf -- "------------------\n"
printf "${blue}OS:${reset_colour} $os_version\n"
printf "${blue}Kernel:${reset_colour} $kernel_version\n"
printf "${blue}Bootloader:${reset_colour} $boot_manager\n"

for i in "${!monitor_names[@]}"
do
    monitor_current_name="${monitor_names[$i]}"
    monitor_current_resolution="${monitor_resolutions[$i]}"

    printf "${blue}Display (%s):${reset_colour} %s\n" "$monitor_current_name" "$monitor_current_resolution"
done

printf "${blue}CPU:${reset_colour} ${cpu_model} (${cpu_amount}) @ ${cpu_speed_ghz} (${cpu_usage} %%)\n"
printf "${blue}GPU:${reset_colour} ${gpu_manufacturer} ${gpu_model}\n"
printf "${blue}Memory:${reset_colour} ${mem_used_gib} GiB / ${mem_total_gib} GiB (${mem_usage} %%)\n"

if [[ $swap_total -ne 0 ]]
then
    printf "${blue}Swap:${reset_colour} ${swap_used_gib} Gib / ${swap_total_gib} GiB (${swap_usage} %%)\n"
else
    printf "${blue}Swap:${reset_colour} Disabled\n"
fi

printf "${blue}Disk (/):${reset_colour} ${disk_root_used_gib} GiB / ${disk_root_total_gib} GiB ($disk_root_usage %%)\n"

if [[ $disk_home_total -ne 0 ]]
then
    printf "${blue}Disk (/home):${reset_colour} ${disk_home_used_gib} GiB / ${disk_home_total_gib} GiB ($disk_home_usage %%)\n"
fi

printf "\n"
printf "${blue}Uptime:${reset_colour} ${uptime_output}\n"

printf "\n"
printf "\n"
printf "\n"