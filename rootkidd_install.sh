#!/bin/bash/sh
# rootkidd's linux install script
# pre-reqs: 
# 	Debian install with no desktop environment
# 	User created and added to sudo

# setup configs and images
mkdir /home/rootkidd/Pictures
mkdir /home/rootkidd/Pictures/Backgrounds
cp -r /home/rootkidd/1337box/Pictures/cyperpunk-girl-mask.png /home/rootkidd/Pictures/Backgrounds/cyperpunk-girl-mask.png
cp -r /home/rootkidd/1337box/Pictures/disconnected4k.png /home/rootkidd/Pictures/Backgrounds/disconnected4k.png
cp -r /home/rootkidd/1337box/Pictures/lock.png /home/rootkidd/Pictures/Backgrounds/lock.png
cp /home/rootkidd/1337box/.bashrc /home/rootkidd/.bashrc
cp -r /home/rootkidd/1337box/bin /home/rootkidd/bin
cp -r /home/rootkidd/1337box/.config /home/rootkidd/.config
cp /home/rootkidd/1337box/.profile /home/rootkidd/.profile

# install base programs
sudo apt update && sudo apt upgrade
sudo apt install nala curl git -y
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list

sudo apt update
sudo nala upgrade
sudo nala install mullvad-vpn xorg xauth net-tools npm nodejs vim kitty firefox-esr bspwm sxhkd polybar picom rofi dunst nitrogen i3lock redshift cmus ranger nmap wpasupplicant -y

sudo apt update
# install vim plug-ins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo apt update
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup component add rust-src
rustup component add rust-analyzer

git clone https://github.com/radareorg/radare2
bash /home/rootkidd/radare2/sys/install.sh

sudo apt update && sudo apt upgrade
sudo nala upgrade
sudo reboot
