#!/bin/sh
# usage: dms-brightness increment|decrement 5
out=$(niri msg --json focused-output | jq -r .name)
case "$out" in
    DP-1) dev="ddc:i2c-5" ;;
    DP-2) dev="ddc:i2c-6" ;;
    DP-3) dev="ddc:i2c-7" ;;
    *)    exit 1 ;;
esac
dms ipc call brightness "$1" "$2" "$dev"
