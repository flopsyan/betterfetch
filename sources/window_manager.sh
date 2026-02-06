#!/usr/bin/env bash

xdg_current_desktop_var="$(echo $XDG_CURRENT_DESKTOP)"
desktop_session_var="$(echo $DESKTOP_SESSION)"
xdg_session_type_var="$(echo $XDG_SESSION_TYPE)"

# Checking variables for the Window Manager
if [ -n "$xdg_current_desktop_var" ]
then
    wm_output="$xdg_current_desktop_var"

elif [ -n "$desktop_session_var" ]
then
    wm_output="$desktop_session_var"

elif [ -n "$xdg_session_type_var" ]
then
    wm_output="$xdg_session_type_var"

else
    wm_output="Unknown"
fi