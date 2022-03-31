#!/usr/bin/zsh

for script in "$ENTRYPOINT_DIR"/setup.d/*.sh; do
    $script &
done
