#!/usr/bin/env bash

### MEMORY

# Total RAM
mem_total="$(cat /proc/meminfo | grep "MemTotal:" | xargs | cut -d' ' -f2)"
mem_total_gib="$(awk "BEGIN {printf \"%.2f\", $mem_total/1024/1024}")"

# Available RAM
mem_available="$(cat /proc/meminfo | grep "MemAvailable:" | xargs | cut -d' ' -f2)"

# Currently used RAM
mem_used="$(($mem_total - $mem_available))"
mem_used_gib="$(awk "BEGIN {printf \"%.2f\", $mem_used/1024/1024}")"

# Memory usage in percent
mem_usage="$(awk "BEGIN {printf \"%.2f\", $mem_used / $mem_total * 100}")"





### SWAP

# Total Swap
swap_total="$(cat /proc/meminfo | grep "SwapTotal:" | xargs | cut -d' ' -f2)"
swap_total_gib="$(awk "BEGIN {printf \"%.2f\", $swap_total/1024/1024}")"

# Free Swap
swap_free="$(cat /proc/meminfo | grep "SwapFree:" | xargs | cut -d' ' -f2)"

# Currently used Swap
swap_used="$(($swap_total - $swap_free))"


# Only do calculations if Swap is enabled
if [ $swap_total -ne 0 ]
then
    # Currently used Swap (in GiB)
    swap_used_gib="$(awk "BEGIN {printf \"%.2f\", $swap_used/1024/1024}")"

    # Memory usage in percent
    swap_usage="$(awk "BEGIN {printf \"%.2f\", $swap_used / $swap_total * 100}")"
fi


# Show swap calculations only if Swap is enabled
if [[ $swap_total -ne 0 ]]
then
    swap_output="${swap_used_gib} Gib / ${swap_total_gib} GiB (${swap_usage} %%)\n"
else
    swap_output="Disabled\n"
fi