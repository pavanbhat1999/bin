#!/bin/bash

hyprctl dispatch focuswindow address:"$(hyprctl -j clients | jq 'map("\(.workspace.id) ∴ \(.workspace.name) ┇ \(.title) ┇ \(.address)")' | sed "s/,$//; s/^\[//; s/^\]//; s/^[[:blank:]]*//; s/^\"//; s/\"$//" | grep -v "^$" | wofi -dO alphabetical | grep -o "0x.*$")"
# hyprctl dispatch focuswindow address:"$(hyprctl -j clients | jq -r '.[] | "\(.address)"' | grep -o "0x.*$" | sed -n '2p')"

