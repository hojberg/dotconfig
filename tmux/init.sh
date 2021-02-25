#!/bin/bash

# -- Personal session ---------------------------------------------------------
tmux new-session -d -s simon

tmux new-window
tmux send-keys "cd ~/code/programming-is-collaboration/book" c-m
tmux send-keys "nvim ." C-m
tmux rename-window " "

tmux new-window
tmux send-keys "cd ~/code/hojberg-xyz" c-m
tmux send-keys "nvim ." C-m
tmux rename-window "hojberg.xyz"

# -- Unison session -----------------------------------------------------------
tmux new-session -d -s unison
tmux send-keys "cd ~/code/unison/unison" C-m
tmux rename-window "stack build && stack exec unison" C-m

tmux new-window
tmux send-keys "cd ~/code/unison/codebase-ui" C-m
tmux rename-window "code-browser" C-m

# Attach
tmux attach-session -t simon
