#!/bin/bash

if [[ $1 == *test_* ]]
then
    exit
fi

tempfile=$(mktemp /tmp/shadow_file.XXXXXX)
printf "%s\n" "$(cat)" >> "$tempfile"
pdm run mypy --show-column-numbers --shadow-file "$1" "$tempfile" "$1"
rm "$tempfile"
