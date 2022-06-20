#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/primary_bar.log
polybar primary 2>&1 | tee -a /tmp/primary_bar.log & disown

if [ "$(cat /etc/hostname)" = 'archie-work' ]; then
    echo "---" | tee -a /tmp/secondary_bar.log
    polybar secondary 2>&1 | tee -a /tmp/secondary_bar.log & disown
fi

echo "Bars launched..."
