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

# cat submodules | perl -e 'while(<>){($a,$b) = split(/\s+/, $_); print `git submodule add $a $b`;}'

# git reset


# do vundle install for vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# :BundleInstall


git clone git@github.com:tarjoilija/zgen.git
source zgen/zgen.zsh

zgen oh-my-zsh

zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-history-substring-search

zgen load djui/alias-tips

zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/sudo
zgen oh-my-zsh plugins/brew
zgen oh-my-zsh plugins/osx
zgen oh-my-zsh plugins/tmux
zgen load RobSis/zsh-completion-generator
zgen load rimraf/k

zgen save

GENCOMPL_FPATH=$HOME/.zsh/complete


zgen load zsh-users/zsh-completions src
