#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit

# Otherwise you can use the nuclear option:
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# exec polybar --reload main

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar --config=$HOME/.config/polybar/config.ini main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
