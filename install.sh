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
ln -sf ~/dotfiles/.vim/dict ~/.vim

# xvim
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc

# ideavim
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc

# latexmk
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc

# git
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

# ctags
ln -sf ~/dotfiles/.ctags ~/.ctags

# scala
ln -sf ~/dotfiles/.scalafmt.conf ~/.scalafmt.conf

# gem
ln -sf ~/dotfiles/.gemrc ~/.gemrc

# custom shell scripts
mkdir ~/bin
ln -sf ~/dotfiles/bin/xcodesign.sh ~/bin/xcodesign
