#!/bin/bash

tempfile=$(mktemp /tmp/shadow_file.XXXXXX)
cat - > "$tempfile"
sxiv "$tempfile"
rm "$tempfile"
