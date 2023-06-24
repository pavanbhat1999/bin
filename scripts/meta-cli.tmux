#!/bin/bash

tmux new -d -s meta-cli

tmux rename-window -t 0 developmet
tmux send-keys -t developmet "cd $HOME/dev/salesforce_projects/empty-project/" ENTER
tmux send-keys -t developmet "nvim list-view-modify.sh" ENTER

tmux neww -t meta-cli
tmux rename-window -t 1 test
tmux send-keys -t test "cd $HOME/dev/salesforce_projects/empty-project/" ENTER
# tmux send-keys -t test "kitty" ENTER

tmux attach-session

