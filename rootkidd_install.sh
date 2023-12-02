#!/bin/bash/sh
# rootkidd's linux install script
# pre-reqs: 
# 	Debian install with no desktop environment
# 	User created and added to sudo

# install base programs
sudo apt update && sudo apt upgrade
sudo apt install nala curl git -y
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list

sudo apt update
sudo nala install mullvad-vpn xorg xauth net-tools npm nodejs vim kitty firefox-esr bspwm sxhkd polybar picom rofi dunst nitrogen i3lock redshift cmus ranger nmap wpasupplicant -y

sudo apt update
# install vim plug-ins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup configs and images
echo "rootkidd is installing bash mods"
cp ./.bashrc ~/.bashrc
echo "rootkidd is installing polybar launch script"
cp -r ./bin ~/bin
echo "rootkidd is installing configs"
cp -r ./.config ~/.config
cp ./.profile ~/.profile
cp -r ./Pictures/Backgrounds ~/Pictures/Backgrounds

sudo apt update
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-src
rustup component add rust-analyzer

git clone https://github.com/radareorg/radare2
bash ~/radare2/sys/install.sh

sudo apt update && sudo apt upgrade
sudo nala upgrade
