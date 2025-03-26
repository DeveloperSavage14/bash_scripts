#!/bin/bash

while true; do
    time=$(date +"%H:%M")
    uptime=$(uptime | awk '{print $3, $4}' | sed 's/,//')

    # Get battery information
    battery=$(acpi -b)
    if [[ -n "$battery" ]]; then
        battery_percent=$(echo "$battery" | awk -F', ' '{print $2}' | sed 's/%//')
        battery_status=$(echo "$battery" | awk -F', ' '{print $3}')
        battery_info="Battery: $battery_percent% ($battery_status)"
    else
        battery_info="Battery: N/A" #if no battery is found
    fi

    # Combine the information
    status="$time | Uptime: $uptime | $battery_info"

    # Set the dwm status bar
    xsetroot -name "$status"

    sleep 5 # Update every 1 second
done
