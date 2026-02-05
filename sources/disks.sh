#!/usr/bin/env bash

### ROOT PARTITION

# Used
disk_root_used="$(df | grep '/' | head -n 1 | xargs | cut -d' ' -f3)"
disk_root_used_gib="$(awk "BEGIN {printf \"%.2f\", $disk_root_used/1024/1024}")"

# Total
disk_root_total="$(df | grep '/' | head -n 1 | xargs | cut -d' ' -f2)"
disk_root_total_gib="$(awk "BEGIN {printf \"%.2f\", $disk_root_total/1024/1024}")"

# Available
disk_root_available="$(df | grep '/' | head -n 1 | xargs | cut -d' ' -f4)"

# Usage in percent
disk_root_usage="$(awk "BEGIN {printf \"%.2f\", $disk_root_used / $disk_root_total * 100}")"





### HOME PARTITION

# Used
disk_home_used="$(df | grep '/home' | xargs | cut -d' ' -f3)"
disk_home_used_gib="$(awk "BEGIN {printf \"%.2f\", $disk_home_used/1024/1024}")"

# Total
disk_home_total="$(df | grep '/home' | xargs | cut -d' ' -f2)"
disk_home_total_gib="$(awk "BEGIN {printf \"%.2f\", $disk_home_total/1024/1024}")"

# Available
disk_home_available="$(df | grep '/home' | xargs | cut -d' ' -f4)"

# Usage in percent
disk_home_usage="$(awk "BEGIN {printf \"%.2f\", $disk_home_used / $disk_home_total * 100}")"


# Check if home disk exists - if not, don't output anything
if [[ $disk_home_total -ne 0 ]] 2>/dev/null
then
    disk_home_output="${blue}Disk (/home):${reset_colour} ${disk_home_used_gib} GiB / ${disk_home_total_gib} GiB ($disk_home_usage %%)\n"
else
    disk_home_output=""
fi