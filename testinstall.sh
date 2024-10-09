#!/bin/bash

set -e

yes | brew install koekeishiya/formulae/yabai
if [-d "~/.config/yabai"]; then
    cp -r ~/.config/yabai ~/.config/yabai_backup
    rm -rf ~/yabai
fi

yes | brew install koekeishiya/formulae/skhd
git clone https://github.com/asexylordrevan/yabai ~/yabai
if [-d "~/.config/skhd"]; then
    cp -r ~/.config/skhd ~/.config/skhd_backup
    rm -rf ~/.config/skhd
fi
git clone https://github.com/asexylordrevan/skhd ~/skhd
skhd --start-service

yes | brew install sketchybar
if [-d "~/.config/sketchybar"]; then
    cp -r ~/.config/sketchybar ~/.config/sketchybar_backup
    rm -rf ~/.config/sketchybar
fi
git clone https://github.com/asexylordrevan/sketchybar ~/.config/sketchybar
