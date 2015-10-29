#!/usr/bin/env bash
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
	clean_link_file $i $1
done

source="${PWD}/_vim/_vimrc"
target="${1}/.vimrc"
link_file $source $target

# cat submodules | perl -e 'while(<>){($a,$b) = split(/\s+/, $_); print `git submodule add $a $b`;}'

# git reset


# do vundle install for vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
:BundleInstall

# do install prezto https://github.com/sorin-ionescu/prezto
# sudo apt-get install zsh
# zsh
git clone --recursive https://github.com/tarekrached/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
# sudo chsh ubuntu -s /bin/zsh
