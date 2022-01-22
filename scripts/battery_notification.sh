#!/usr/bin/bash
STATUS=$(cat /sys/class/power_supply/BAT0/status)
CURRENT_BAT=$(cat /sys/class/power_supply/BAT0/capacity)
UPPER_LIMIT=85
LOWER_LIMIT=30
if [ "$STATUS" = "Charging" ]; then
    echo 'Charging'
    if [ $CURRENT_BAT -gt $UPPER_LIMIT ]
    then
        notify-send "Charging Above given limit Please Unplug the Charger" -u critical
    fi
else
    echo "Not Charging"
    if [ $CURRENT_BAT -gt $LOWER_LIMIT ]
    then
        echo 'Optimum Charge'
    fi
    if [ $CURRENT_BAT -lt $LOWER_LIMIT ]
    then
        notify-send "Gone below Lower Limit. Charge Me Please" -u critical
    fi
fi
