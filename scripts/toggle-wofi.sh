#!/bin/bash
#
if pgrep -x wofi; then
    pkill wofi
else
    wofi --show drun
fi
