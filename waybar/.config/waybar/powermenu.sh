#!/bin/bash

# Define the menu options
shutdown="⏻ Shutdown"
reboot="⟳ Reboot"
suspend="⏾ Suspend"
logout="󰗽 Logout"

# Combine options with line breaks
options="$shutdown\n$reboot\n$suspend\n$logout"

# Pipe into Rofi. 
# -location 3 = Top Right. Adjust -yoffset and -xoffset to align it perfectly under your button.
chosen=$(echo -e "$options" | rofi -dmenu -i -p  -theme-str 'window {height: 180px; width: 250px;} inputbar {enabled: false;}' -location 3 -yoffset 35 -xoffset -15)

# Execute the systemctl command based on the choice
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        loginctl terminate-user $USER
        ;;
esac
