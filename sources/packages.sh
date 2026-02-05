#!/usr/bin/env bash

packages_pacman="$(pacman -Q | wc -l)"
packages_flatpak="$(flatpak list | wc -l)" # flatpak automatically removes headlines on pipes


# check if flatpak is installed - if not, don't output text
if [ $packages_flatpak -ne 0 ] 2> /dev/null
then
    packages_flatpak_output=", $packages_flatpak (flatpak)"
else
    packages_flatpak_output=""
fi