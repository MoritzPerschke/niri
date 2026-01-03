#!/usr/bin/env bash
# ~/.config/sway/powermenu.sh

options=" Shutdown
 Reboot
鈴 Suspend
 Lock
 Logout"

choice=$(echo "$options" | fuzzel --dmenu --prompt "Power: ")

case "$choice" in
    " Shutdown") systemctl poweroff ;;
    " Reboot") systemctl reboot ;;
    "鈴 Suspend") systemctl suspend ;;
    " Lock") swaylock ;;  # or your preferred locker
    " Logout") loginctl terminate-session "$XDG_SESSION_ID" ;;
esac
