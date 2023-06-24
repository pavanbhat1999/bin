#!/bin/bash

# Set the file paths
zshrc_file="$HOME/.zshrc"
nvim_init_file="$HOME/.config/nvim/init.lua"
rofi_file="$HOME/.config/rofi/config.rasi"
wal_sequences_file="$HOME/.cache/wal/sequences"

# Function to modify a file
modify_file() {
    local file_path=$1
    local search_string=$2
    local remove_string=$3
    local append_string=$4

    if grep -qF "$search_string" "$file_path"; then
        sed -i "/$remove_string/d" "$file_path"
        echo "Line(s) containing '$search_string' removed from $file_path"
    else
        echo "$append_string" >> "$file_path"
        echo "No lines containing '$search_string' appended to $file_path"
    fi
}

# Check and modify .zshrc
modify_file "$zshrc_file" ".cache/wal/sequences" "\.cache\/wal\/sequences" "(cat $wal_sequences_file &)"

# Check and modify nvim init.lua
modify_file "$nvim_init_file" "pywal.setup" "pywal.setup" "local pywal = require('pywal') pywal.setup()"

# Check and modify rofi config.rasi
modify_file "$rofi_file" "wal/colors" "wal\/colors" "@import \"~/.cache/wal/colors-rofi-dark\""

