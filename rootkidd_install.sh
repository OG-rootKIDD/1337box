#!/bin/bash/sh
# rootkidd's linux install script
# pre-reqs: 
# 	Debian install with no desktop environment
# 	User created and added to sudo

# configs
cp /home/rootkidd/1337box/.bashrc /home/rootkidd/.bashrc
sudo chown rootkidd /home/rootkidd/.bashrc
cp /home/rootkidd/1337box/.profile /home/rootkidd/.profile
sudo chown rootkidd /home/rootkidd/.profile
mkdir /home/rootkidd/.vim
sudo chown rootkidd /home/rootkidd/.vim
mkdir /home/rootkidd/.vim/autoload
sudo chown rootkidd /home/rootkidd/.vim/autoload
cp /home/rootkidd/1337box/.vim/autoload/plug.vim /home/rootkidd/.vim/autoload/plug.vim
sudo chown rootkidd /home/rootkidd/.vim/autoload/plug.vim
cp /home/rootkidd/1337box/.vimrc /home/rootkidd/.vimrc
sudo chown rootkidd /home/rootkidd/.vimrc

# Pictures
mkdir /home/rootkidd/Pictures
sudo chown rootkidd /home/rootkidd/Pictures
mkdir /home/rootkidd/Pictures/Backgrounds
sudo chown rootkidd /home/rootkidd/Pictures/Backgrounds
cp -r /home/rootkidd/1337box/Pictures/Backgrounds/background.png /home/rootkidd/Pictures/Backgrounds/cyperpunk-girl-mask.png
cp -r /home/rootkidd/1337box/Pictures/Backgrounds/lock.png /home/rootkidd/Pictures/Backgrounds/lock.png
sudo chown -R rootkidd /home/rootkidd/Pictures
cp -r /home/rootkidd/1337box/bin /home/rootkidd/bin
sudo chown -R /home/rootkidd/bin
cp -r /home/rootkidd/1337box/.config /home/rootkidd/.config
sudo chown rootkidd /home/rootkidd/.config

# Programs
sudo apt install nala  -y
sudo apt update && sudo apt upgrade
sudo nala upgrade
sudo nala install curl git xorg xauth net-tools npm nodejs vim kitty firefox-esr bspwm sxhkd polybar picom rofi dunst nitrogen i3lock redshift cmus ranger nmap wpasupplicant -y
sudo apt update
sudo nala upgrade
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup component add rust-src
rustup component add rust-analyzer
git clone https://github.com/radareorg/radare2
bash /home/rootkidd/radare2/sys/install.sh

# update and reboot
sudo apt update && sudo apt upgrade
sudo nala upgrade
sudo reboot
