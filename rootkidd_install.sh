#! /bin/bash/sh
# rootkidd's linux install script
# pre-reqs: 
# 	Debian install with no desktop environment
# 	User created and added to sudo

sudo apt update && sudo apt upgrade
sudo apt install nala curl git -y
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo nala upgrade
sudo nala install mullvad-vpn xorg xauth net-tools npm nodejs vim rust kitty firefox-esr bspwm sxhkd polybar picom rofi dunst nitrogen i3lock redshift cmus ranger nmap wpasupplicant -y
rustup component add rust-src
rustup component add rust-analyzer

# install vim plug-ins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup config scripts
echo "rootkidd is installing bash mods"
cp ./.bashrc ~/.bashrc
echo "rootkidd is installing polybar launch script"
cp -r ./bin ~/bin
echo "rootkidd is installing configs"
cp -r ./.config ~/.config
# setup profile script
cp ./.profile ~/.profile
# copy backgrounds
echo "rootkidd is installing backgrounds"
cp -r ./Pictures/Backgrounds ~/Pictures/Backgrounds

# install radare2
echo "rootkidd is installing radare2"
git clone https://github.com/radareorg/radare2
bash ~/radare2/sys/install.sh

echo "rootkidd is done installing"
