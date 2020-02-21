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
