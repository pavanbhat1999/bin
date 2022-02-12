#!/bin/sh

tmux new -d -s flutter

tmux rename-window -t 0 development
tmux send-keys -t development "cd $HOME/Downloads/flutter/flutter_application_1/" ENTER
tmux send-keys -t development "nvim " ENTER

tmux neww -t flutter
tmux rename-window -t 1 cli
tmux send-keys -t cli "cd $HOME/Downloads/flutter/flutter_application_1/" ENTER
