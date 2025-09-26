#!/bin/bash

# Détection automatique du lecteur actif
# Si aucun lecteur spécifique n'est trouvé, playerctl utilisera le premier disponible
PLAYER=""

# Format de sortie
FORMAT="{{ title }} - {{ artist }}"

PLAYERCTL_STATUS=$(playerctl status 2>/dev/null)

if [ "$PLAYERCTL_STATUS" = "Playing" ] || [ "$PLAYERCTL_STATUS" = "Paused" ]; then
    # Affiche le titre et l'artiste si la musique joue ou est en pause
    playerctl metadata --format "$FORMAT"
else
    # Affiche un message par défaut si aucun lecteur n'est actif
    echo "Pas de musique"
fi