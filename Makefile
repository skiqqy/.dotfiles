# Skippy's Makefile for .dotfiles
DIR=$(shell pwd)

all: setupbin install vim bash

setupbin:
	mkdir -p ~/bin
	cp $(DIR)/miscfiles/scripts/* ~/bin
	-rm -f ~/bin/upd

# Make backup directory, and setup update script
install:
	mkdir -p ~/.backup
	$(shell echo "INSTALL_LOC=$(PWD)" > ~/bin/upd)
	$(shell cat $(DIR)/miscfiles/scripts/upd >> ~/bin/upd)
	chmod +x ~/bin/*

vim: install powerline-fonts
	-rm -rf ~/.backup/.vim #only backup the latest .vim directory
	-mv -f ~/.vim ~/.backup
	-mv -f ~/.vimrc ~/.backup
	#link files, and copy requirments
	mkdir -p ~/.vim/autoload
	cp $(DIR)/miscfiles/plug.vim ~/.vim/autoload
	ln -s $(DIR)/.vimrc ~/.vimrc #Link to vimrc

bash: install
	#only uses simple config for now
	-mv -f ~/.bashrc ~/.backup
	#link files
	ln -s $(DIR)/miscfiles/bash/.bashrc_1 ~/.bashrc

zsh: install
	-mv -f ~/.zshrc ~/.backup
	#link files
	ln -s $(DIR)/miscfiles/zsh/.zshrc_1

powerline-fonts:
	#install powerline-fonts
	git clone https://github.com/powerline/fonts.git --depth=3
	./fonts/install.sh
	rm -rf fonts

uninstall: install
	-rm -rf ~/.vim
	-rm -rf ~/.vimrc
	-rm -rf ~/.bashrc
	#restore
	-mv -f ~/.backup/.bashrc ~/
	-mv -f ~/.backup/.vim ~/
	-mv -f ~/.backup/.vimrc ~/
