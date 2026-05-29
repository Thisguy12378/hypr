#!/bin/bash

# ─── Palette ───────────────────────────────────────────────────────────────
# Torii red: #C0634A   Sky blue: #5BA4CF   Green: #6A9F4E

separator="─────────────────────"

options=" Display\n Network\n Bluetooth\n  Volume\n Night Light\n${separator}\n  Shutdown\n  Reboot\n  Suspend\n  Lock\n  Logout"

chosen=$(echo -e "$options" | rofi \
    -dmenu \
    -i \
    -p "  Settings" \
    -theme-str 'window { width: 340px; border-radius: 16px; }
                listview { lines: 12; }
                element-text { color: #2C3E50; }
                element.selected { background-color: rgba(91,164,207,0.25); }' \
    2>/dev/null)

[[ -z "$chosen" ]] && exit 0

case "$chosen" in
    *Display*)
        # Toggle between 165Hz and 60Hz
        if hyprctl monitors | grep -q "165.00"; then
            hyprctl keyword monitor eDP-1,2560x1600@60,auto,1
            notify-send -i display "Display" "Switched to 60 Hz (battery saver)"
        else
            hyprctl keyword monitor eDP-1,2560x1600@165,auto,1
            notify-send -i display "Display" "Switched to 165 Hz"
        fi
        ;;
    *Network*)
        kitty --class float_network -e nmtui
        ;;
    *Bluetooth*)
        blueman-manager
        ;;
    *Volume*)
        pavucontrol
        ;;
    *Night*)
        if pgrep -x wlsunset > /dev/null; then
            pkill wlsunset
            notify-send "Night Light" "Turned off"
        else
            wlsunset -t 4200 -T 6500 &
            notify-send "Night Light" "Turned on (4200 K)"
        fi
        ;;
    *Shutdown*)
        systemctl poweroff
        ;;
    *Reboot*)
        systemctl reboot
        ;;
    *Suspend*)
        systemctl suspend
        ;;
    *Lock*)
        hyprlock
        ;;
    *Logout*)
        hyprctl dispatch exit
        ;;
esac