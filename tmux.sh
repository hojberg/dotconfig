#!/bin/bash

tmux new-window
tmux send-keys "cd ~/code/programming-is-collaboration" c-m
tmux send-keys "nvim ." C-m
tmux rename-window " "

tmux new-window
tmux send-keys "cd ~/code/hojberg-xyz" c-m
tmux send-keys "nvim ." C-m
tmux rename-window "hojberg.xyz"
