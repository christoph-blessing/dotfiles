#!/bin/bash

if [[ $1 == *test_* ]] || [[ $1 == *conftest.py ]]
then
    exit
fi

if [ ! -f "$1" ]
then
    exit
fi

tempfile=$(mktemp /tmp/shadow_file.XXXXXX)
printf "%s\n" "$(cat)" >> "$tempfile"
mypy --follow-imports silent --show-column-numbers --no-error-summary --shadow-file "$1" "$tempfile" "$1"
rm "$tempfile"
