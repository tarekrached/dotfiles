#!/usr/bin/env zsh

function clean_link_file {
    source="${PWD}/$1"
    target="${2}/${1/_/.}"
	link_file $source $target
}

function link_file {
	source=$1
	target=$2

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

for i in _*
do
	clean_link_file $i $HOME
done

source="${PWD}/_vim/_vimrc"
target="${1}/.vimrc"
link_file $source $target

# do vundle install for vim plugins
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# :BundleInstall
