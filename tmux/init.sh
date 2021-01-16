#!/bin/bash

# -- Personal session ---------------------------------------------------------
tmux new-session -d -s simon

tmux new-window
tmux send-keys "cd ~/code/programming-is-collaboration" c-m
tmux send-keys "nvim ." C-m
tmux rename-window " "

tmux new-window
tmux send-keys "cd ~/code/hojberg-xyz" c-m
tmux send-keys "nvim ." C-m
tmux rename-window "hojberg.xyz"

# -- Unison session -----------------------------------------------------------
tmux new-session -d -s unison
tmux send-keys "cd ~/code/unison/unison-code-browser" C-m
tmux rename-window "code-browser" C-m

# Attach
tmux attach-session -t simon
