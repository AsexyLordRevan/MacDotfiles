#!/bin/bash

set -e

yes | brew install koekeishiya/formulae/yabai
if [-d "~/.config/yabai"]; then
    cp -r ~/.config/yabai ~/.config/yabai_backup
    rm -rf ~/yabai
fi
git clone https://github.com/asexylordrevan/macdotfiles/yabai ~/.config/yabai
yes | brew install borders
yes | brew install koekeishiya/formulae/skhd
if [-d "~/.config/skhd"]; then
    cp -r ~/.config/skhd ~/.config/skhd_backup
    rm -rf ~/.config/skhd
fi
git clone https://github.com/asexylordrevan/macdotfiles/skhd ~/.config/skhd
skhd --start-service

yes | brew install sketchybar
if [-d "~/.config/sketchybar"]; then
    cp -r ~/.config/sketchybar ~/.config/sketchybar_backup
    rm -rf ~/.config/sketchybar
fi
git clone https://github.com/asexylordrevan/sketchybar ~/.config/sketchybar

if [! -f /Applications/kitty.app]; then
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi
if [-d ~/.config/kitty/]; then
	cp -r ~/.config/kitty ~/.config/kitty_backup
	rm -rf ~/.config/kitty
fi
git clone https://github.com/asexylordrevan/ ~/.config/kitty
yes | brew install neovim
if [-d ~/.config/nvim]; then
	cp -r ~/.config/nvim ~/.config/nvim_backup
	rm -rf ~/.config/nvim
fi
git clone https://github.com/asexylordrevan/macdotfiles/nvim ~/.config/nvim
if [! -f ~/.p10k.zsh]; then
	yes | brew install powerlevel10k
	p10k --configure
PS2:'Install wallpapers into Documents folder ?'
options=("y","n")
select opt in "${options[@]}"
do
    case $opt in
		"y")
			if [! -f ~/Documents/Wallpapers]; then
				git clone https://github.com/asexylordrevan/macdotfiles/wallpaper ~/Documents/Wallpapers
			else
				echo "Wallpaper folder already exists. Feel free to download them manually"
			;;
		"n")
			break
			;;
	esac
done
echo "Done. You need to finish up manually by following the instructions in the install guide (https://asexylordrevan/macdotfiles/install.txt)"
