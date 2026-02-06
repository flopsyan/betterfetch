#!/usr/bin/env bash

locale_lang="$(locale | grep "LANG=" | cut -d= -f2)"
locale_all="$(locale | grep "LC_ALL=" | cut -d= -f2)"

if [ -n $locale_lang ]
then
    locale_output="$locale_lang"

elif [ -n $locale_all ]
then
    locale_output="$locale_all"

else
    locale_output="Unknown"
fi