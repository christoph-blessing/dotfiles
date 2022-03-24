#!/bin/bash

ignored_patterns=('^test_.+\.py$' 'conftest\.py')
for ignored_pattern in "${ignored_patterns[@]}"; do
    if [[ "$(basename "$1")" =~ $ignored_pattern ]]; then
        exit 0
    fi
done
echo "$(cat)" | pylint --from-stdin --score n --msg-template '{line}:{column}:{C}:{msg}' "$1"
