#!/usr/bin/env bash


# Uptime (both parts; second and milliseconds)
uptime_proc_ms="$(cat /proc/uptime | cut -d'.' -f2 | cut -c 1-2)"
uptime_proc_sec="$(cat /proc/uptime | cut -d'.' -f1)"


# if milliseconds are above 50, round to next number
if [ $uptime_proc_ms -ge 50 ]
then
    uptime_proc_sec="$((uptime_proc_sec + 1))"
fi


# Uptime in days, hours, seconds and minutes
uptime_days="$((uptime_proc_sec / 86400))"
uptime_hours="$(((uptime_proc_sec % 86400) / 3600))"
uptime_minutes="$(((uptime_proc_sec % 3600) / 60))"
uptime_seconds="$((uptime_proc_sec % 60))"


# Display correct days if days, hours and/or minutes is zero
if [ $uptime_days -ne 0 ]
then
    uptime_output="$uptime_days days, $uptime_hours hours, $uptime_minutes minutes, $uptime_seconds seconds"
elif [ $uptime_hours -ne 0 ]
then
    uptime_output="$uptime_hours hours, $uptime_minutes minutes, $uptime_seconds seconds"
elif [ $uptime_minutes -ne 0 ]
then
    uptime_output="$uptime_minutes minutes, $uptime_seconds seconds"
else
    uptime_output="$uptime_seconds seconds"
fi