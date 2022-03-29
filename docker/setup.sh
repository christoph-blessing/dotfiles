#!/usr/bin/zsh

for script in /root/setup.d/*.sh; do
    $script &
done
