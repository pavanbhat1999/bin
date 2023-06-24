#!/bin/sh

tmux new -d -s electron-app

tmux rename-window -t 0 development
tmux send-keys -t development "cd $HOME/dev/electron-apps/" ENTER
tmux send-keys -t development "nvim index.html" ENTER

tmux neww -t electron-app
tmux rename-window -t 1 cli
tmux send-keys -t cli "cd $HOME/dev/electron-apps/" ENTER

tmux attach-session
