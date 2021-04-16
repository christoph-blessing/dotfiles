#!/bin/bash

tempfile=$(mktemp /tmp/shadow_file.XXXXXX)
printf "$(cat)" >> "$tempfile"
pdm run mypy --show-column-numbers --shadow-file "$1" "$tempfile" "$1"
rm "$tempfile"
