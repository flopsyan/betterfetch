#!/usr/bin/env bash

# sources
source ./sources/displays.sh
source ./sources/quick_queries.sh


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
printf "\n"
printf "\n"