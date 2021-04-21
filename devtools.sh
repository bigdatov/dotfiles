sudo snap install ripgrep --classic

function install() {
    which $1 &>/dev/null
    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

# TODO make all the `echo` and `printf` calls formatted in bold pink
pink="\e[38;5;211m"
bold="\e[1m"
reset="\e[0m"
mkdir ~/devtools

function install_tarball() {
    wget $2
    bn=$(basename $2)
    printf "\n${pink}${bold}${bn}${reset}\n"
    tar xvf $bn
    rm -f $bn
    if [ -f $1 ]; then
        mkdir ~/devtools/$1
        printf "\n${pink}${bold}found binary file ${1}${reset}\n"
        cp $1 ~/devtools/$1
        rm -r $1
        printf "\n${pink}${bold}alias ${1}='~/devtools/$1/$1'${reset}\n"
        printf "alias ${1}='~/devtools/$1/$1'\n" >>~/.bashrc
    fi
    dn=${bn%.tar.gz}
    if [ -d $dn ]; then
        printf "\n${pink}${bold}found dir with binaries ${dn}${reset}\n"
        cp -r $dn ~/devtools
        mv ~/devtools/$dn/ ~/devtools/$1/
        rm -rf $dn
        printf "\n${pink}${bold}alias ${1}='~/devtools/$1/$1'${reset}\n"
        printf "alias ${1}='~/devtools/$1/$1'\n" >>~/.bashrc
    fi
}

# install ripgrep
# install pandoc
# install poppler-utils
# install ffmpeg
install_tarball xsv https://github.com/BurntSushi/xsv/releases/download/0.13.0/xsv-0.13.0-x86_64-unknown-linux-musl.tar.gz
install_tarball fd https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-v8.2.1-x86_64-unknown-linux-musl.tar.gz
install_tarball rga https://github.com/phiresky/ripgrep-all/releases/download/v0.9.6/ripgrep_all-v0.9.6-x86_64-unknown-linux-musl.tar.gz
