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

# -- Unison servers -----------------------------------------------------------

tmux new-session -d -s " unison-servers"
tmux send-keys "cd ~/code/unison/share-ui" C-m
tmux send-keys "API_URL='http://127.0.0.1:5424' npm start" C-m
tmux split -h
tmux send-keys "cd ~/code/unison/enlil" C-m
tmux send-keys "make serve" C-m
tmux rename-window "share-servers"

tmux new-window
tmux send-keys "cd ~/code/unison/local-ui" C-m
tmux send-keys "API_URL='http://127.0.0.1:8080/asdf/api' npm start -- --port 2345" C-m
tmux split -h
tmux send-keys "cd ~/code/unison/unison" C-m
tmux send-keys "UCM_TOKEN=asdf UCM_PORT=8080 unison --codebase ~/code/unison-code" C-m
tmux rename-window "local-servers"

# -- Unison workspace ---------------------------------------------------------

tmux new-session -d -s "  unison-coding"

tmux send-keys "cd ~/code/unison/share-ui" C-m
tmux send-keys "nvim ." C-m
tmux rename-window "share-ui"

tmux new-window
tmux send-keys "cd ~/code/unison/local-ui" C-m
tmux send-keys "nvim ." C-m
tmux rename-window "local-ui"

tmux new-window
tmux send-keys "cd ~/code/unison/ui-core" C-m
tmux send-keys "nvim ." C-m
tmux rename-window "ui-core"


# Attach
tmux attach-session -t "  unison-coding"
