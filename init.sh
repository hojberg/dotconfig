#!/bin/bash

ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf 
ln -s ~/.config/tmux/init.sh ~/init-tmux
ln -s ~/.config/git/gitconfig ~/.gitconfig

# npm deps
npm i -g @elm-tooling/elm-language-server
npm i -g purescript spago purescript-language-server
