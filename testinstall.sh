#!/bin/bash

set -e

yes | brew install koekeishiya/formulae/yabai
yes | brew install koekeishiya/formulae/skhd
if [-d "~/yabai"]; then
    cp -r ~/.config/yabai ~/.config/yabai_backup
    rm -rf ~/yabai
fi
git clone https://github.com/asexylordrevan/yabai ~/yabai

skhd --start-service
