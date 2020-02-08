#!/bin/bash

# personal session
tmux new-session -d -s personal
tmux send-keys "nvim -c HackerNews" C-m
tmux rename-window " "

tmux new-window
tmux send-keys "cd ~/code/nornir" c-m
tmux send-keys "make" c-m
tmux rename-window " "

tmux new-window
tmux send-keys "cd ~/code/collaborative-programmer" c-m
tmux send-keys "nvim ." C-m
tmux rename-window " "

# salsify session
tmux new-session -d -s salsify
tmux send-keys "cd ~/code/salsify/dandelion" C-m
tmux send-keys "rvm use" C-m
tmux send-keys "script/run_development_servers.sh" C-m
tmux split
tmux send-keys "cd ~/code/salsify/dandelion/client/salsify" C-m
tmux send-keys "yarn develop" C-m
tmux rename-window "servers" C-m

tmux new-window
tmux send-keys "cd ~/code/salsify/dandelion/client/salsify" C-m
tmux send-keys "nvim ." C-m
tmux rename-window "salsify"

# Attach
tmux attach-session -t salsify
