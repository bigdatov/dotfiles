#!/bin/bash

function install() {
    name=${1}
    echo $name
    code --install-extension ${name} --force
}

printf "installing backed up extensions list"

while read y
do
printf "\n"
install $y
done < /home/bigdatov/dotfiles/.config/Code/extensions.txt

printf "installed all extensions"
