#!/bin/bash -x

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Correct the problem of two polybars on the same screen
if [[ $(polybar --list-monitors | wc -l) == 1 ]]; then
    MONITOR_PRIMARY=$(polybar --list-monitors | cut -d":" -f1)
    MONITOR_EXTRA=""
else
    MONITORS=$(polybar --list-monitors)
    MONITOR_PRIMARY=$(echo "$MONITORS" | grep "primary" | cut -d":" -f1)
    MONITOR_EXTRA=$(echo "$MONITORS" | grep -v "primary" | cut -d":" -f1)
fi

# Start main polybar with tray
MONITOR=$MONITOR_PRIMARY MOD_RIGHT="systray microphone pulseaudio memory cpu filesystem battery wlan eth date" polybar main &
for m in $MONITOR_EXTRA; do
    MONITOR=$m MOD_RIGHT="microphone pulseaudio memory cpu filesystem battery wlan eth date" polybar main &
done
