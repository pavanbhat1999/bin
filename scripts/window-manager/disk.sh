#!/bin/bash
case $BLOCK_BUTTON in
    1)mem="$(df | awk 'FNR == 4 {print $4/1000000 "GB"}')" ;;
    3)notify-send "Memmory Consumers 
        $(ps axch -o cmd:15,%mem --sort=-%mem | head) ";;
esac
#mem="$(df | awk 'FNR == 4 {print $4/1000000 "GB"}')"
echo -e "$mem"
