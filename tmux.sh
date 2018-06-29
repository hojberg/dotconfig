#!/bin/bash

# setup upserve
tmux new-session -d -s upserve -n 'point_of_sale_server'
tmux send-keys "cd ~/code/upserve/point_of_sale" C-m
tmux send-keys "yarn start" C-m

tmux new-window -t upserve:2 -n 'point_of_sale'
tmux send-keys "cd ~/code/upserve/point_of_sale" C-m
tmux send-keys "nvim ." C-m

# setup personal
tmux new-session -d -s personal
tmux send-keys "nvim -c HackerNews" C-m

# Attach
tmux attach-session -t upserve
