#!/bin/bash

# Options for the menu
options="󰂄 Power Mode\n󰖩 Network (nmtui)\n󰂯 Bluetooth (blueman)\n󰃠 Display (60Hz/165Hz)\n󰤄 Night Light"

chosen=$(echo -e "$options" | rofi -dmenu -i -p " Quick Settings " -config ~/.config/rofi/config.rasi)

case $chosen in
    *Power*)
        # Using 'bat' instead of 'battery'
        sudo tlp bat && notify-send "Power" "TLP: Battery Mode (Throttled)" || sudo tlp ac && notify-send "Power" "TLP: AC Mode (Performance)"
        ;;
    *Network*)
        kitty --class float_network -e nmtui
        ;;
    *Bluetooth*)
        blueman-manager
        ;;
    *Display*)
        # Toggle Refresh Rate logic
        if hyprctl monitors | grep -q "165.00"; then
            hyprctl keyword monitor eDP-1,2560x1600@60,auto,1
            notify-send "Display" "Switched to 60Hz"
        else
            hyprctl keyword monitor eDP-1,2560x1600@165,auto,1
            notify-send "Display" "Switched to 165Hz"
        fi
        ;;
    *Night*)
        # Requires wlsunset
        pkill wlsunset || wlsunset -t 4500 &
        ;;
esac