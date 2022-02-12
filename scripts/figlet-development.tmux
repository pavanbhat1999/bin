#!/bin/bash

tmux new -d -s figlet

tmux rename-window -t 0 developmet
tmux send-keys -t developmet "cd $HOME/.config/figlet.nvim/" ENTER
tmux send-keys -t developmet "nvim " ENTER

tmux neww -t figlet
tmux rename-window -t 1 test
tmux send-keys -t test "cd $HOME/.config/nvim" ENTER
tmux send-keys -t test "nvim --cmd 'set rtp+=/home/root99/.config/figlet.nvim' test.py" ENTER
