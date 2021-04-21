#!/bin/bash

# copy dotfiles
source ./copy.sh

# update fonts cache
fc-cache -f -v

# update ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install() {
    which $1 &>/dev/null
    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

function install_tarball() {
    wget $2
    tar xvf $(basename $2)
    rm -f $(basename $2)
    mv ./$1 ~/
}

# basic stuff
install make
install curl
install vim
install git
install zip
install rar
install unzip
install unrar
install file
install htop
install tree
install wget
install llvm
install gnupg
install dialog
install python-is-python3
install python3-dev

# remember to `rclone config` your cloud storage
curl https://rclone.org/install.sh | sudo bash

# stuff needed for pyenv
install build-essential
install libssl-dev
install zlib1g-dev
install libbz2-dev
install libreadline-dev
install libsqlite3-dev
install libncurses5-dev
install xz-utils
install tk-dev
install libxml2-dev
install libxmlsec1-dev
install libffi-dev
install liblzma-dev

# browsers and networking
install apt-transport-https
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
install brave-browser
install chrome-gnome-shell
install chromium-browser
install exfat-utils
install openvpn
install docker.io
install nmap

# vscode
sudo snap install --classic code

# devtools
bash devtools.sh

# run all scripts in scripts/
for scrpt in scripts/*.sh; do bash "$scrpt" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# shitposting
install figlet
install lolcat
figlet -k "bruh  moment" | lolcat
