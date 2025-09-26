#!/bin/bash

# Get player status (auto-detect active player)
PLAYERCTL_STATUS=$(playerctl status 2>/dev/null)

if [ "$PLAYERCTL_STATUS" = "Playing" ]; then
    # Show pause icon when music is playing
    echo "%{F#A54242}󰏤%{F-}"
elif [ "$PLAYERCTL_STATUS" = "Paused" ]; then
    # Show play icon when music is paused
    echo "%{F#6bca80}󰐊%{F-}"
else
    # Show play icon when no player is active
    echo "%{F#6bca80}󰐊%{F-}"
fi