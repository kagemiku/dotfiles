#!/bin/sh
# shells
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim
ln -sf ~/dotfiles/.vim/colors ~/.vim
ln -sf ~/dotfiles/.vim/userautoload ~/.vim
ln -sf ~/dotfiles/.vim/plugin ~/.vim

# xvim
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc

# latexmk
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc

# git
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

