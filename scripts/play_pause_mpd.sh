#!/bin/bash
# first: find a non-mpd player that's currently Playing
PLAYER=$(playerctl -l | grep -v mpd | while read p; do
    if [ "$(playerctl --player=$p status 2>/dev/null)" = "Playing" ]; then
        echo $p
        break
    fi
done)

# second: find a non-mpd player that's Paused
if [ -z "$PLAYER" ]; then
    PLAYER=$(playerctl -l | grep -v mpd | while read p; do
        if [ "$(playerctl --player=$p status 2>/dev/null)" = "Paused" ]; then
            echo $p
            break
        fi
    done)
fi

# finally: fall back to mpd
playerctl --player="${PLAYER:-mpd}" play-pause
