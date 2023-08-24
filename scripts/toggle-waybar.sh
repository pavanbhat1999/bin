#!/bin/bash

# Name of the program to toggle
program_name="waybar"

# Check if the program is running
if pgrep -x "$program_name" > /dev/null; then
    # Program is running, so let's stop it
    pkill -x "$program_name"
    echo "Stopped $program_name"
else
    # Program is not running, so let's start it
    "$program_name" &
    echo "Started $program_name"
fi
