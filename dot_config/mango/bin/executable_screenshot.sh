#!/bin/bash
# Usage: screenshot.sh [area|screen]
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/Screenshot from $(date '+%Y-%m-%d %H-%M-%S').png"

case "${1:-area}" in
    area)
        GEOM="$(slurp)" || exit 0
        grim -g "$GEOM" "$FILE" || exit 1
        ;;
    screen)
        grim "$FILE" || exit 1
        ;;
    *)
        echo "Usage: $0 [area|screen]" >&2
        exit 1
        ;;
esac

wl-copy --type image/png < "$FILE"
notify-send "Screenshot saved & copied" "$FILE"
