#!/bin/sh
VIMHOME=~/.vim

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone git://github.com/proxhotdog/vim_backup.git "$VIMHOME"
cd "$VIMHOME"
git submodule update --init

cd ..
ln -s .vim/vimrc .vimrc

echo "vimrc is installed."

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +qall

read -p "Run vim? (y/n)" choice
if [ "$choice" == "y" ] then
	vim;
fi
