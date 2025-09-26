#!/bin/bash

# La taille de l'espace que tu veux en haut (en pixels)
GAP_SIZE=500

# Un fichier temporaire pour garder en mémoire l'état (activé/désactivé)
STATE_FILE="/tmp/i3_top_gap_state"

if [ -f "$STATE_FILE" ]; then
    # Si le fichier existe, l'espace est activé -> on le désactive
    i3-msg 'gaps top all set 0'
    rm "$STATE_FILE"
else
    # Si le fichier n'existe pas, l'espace est désactivé -> on l'active
    i3-msg "gaps top all set ${GAP_SIZE}"
    touch "$STATE_FILE"
fi