#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Usage: $0 <cmd> file1 [file2 ...]"
    exit 1
fi

cmd="$1"
shift
files=$*

process() {
    cmd="$1"
    shift
    files="$*"

    exit_code=0
    for file in $files; do
        if ! $cmd "$file"; then
            exit_code=1
        fi
    done
    exit $exit_code
}

format() {
    temp=$(mktemp /tmp/snapshot.XXXXXX)
    jq --sort-keys '.' "$1" > "$temp"
    echo "$temp"
}

write() {
    formatted=$(format "$1")
    mv "$formatted" "$1"
    echo "$1 formatted"
}

check() {
    formatted=$(format "$1")
    if ! diff --brief "$formatted" "$1" > /dev/null; then
        echo "$1 would be formatted"
        return 1
    fi
}

case "$cmd" in
    "format") process write "$files";;
    "check") process check "$files";;
    *) echo "Unknown command: $cmd";;
esac
