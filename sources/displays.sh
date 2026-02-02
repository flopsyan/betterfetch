#!/usr/bin/env bash

# initilize arrays to save the for loop output
monitor_names=()
monitor_resolutions=()

for monitor_path in /sys/class/drm/* # loop through /sys/class/drm/ to get all monitors
do
    if grep -q "^connected" "$monitor_path/status" 2>/dev/null # check if monitor is connected (every folder has a status file)
    then
        monitor_resolution=$(head -n 1 "$monitor_path/modes") # get resolution from the modes file - the current resolution is on top

        if [ -f "$monitor_path/edid" ] # get name from the binary file EDID (contains monitor data)
        then
            monitor_model_name=$(edid-decode "$monitor_path/edid" 2>/dev/null | grep -E "Monitor Name|Display Product Name|Model name" | cut -d: -f2 | xargs) # decode EDID into readable text, search name, cut output, remove whitespaces
        fi

        if [ -z "$monitor_model_name" ] # if no name can be found, output generic text
        then 
            monitor_model_name="Unknown Display"
        fi

        # printf "${blue}Display (%s):${reset} %s\n" "$monitor_model_name" "$monitor_resolution" # the output - %s gets replaced by the variables at the end

        # save output to array
        monitor_names+=("$monitor_model_name")
        monitor_resolutions+=("$monitor_resolution")
    fi
done