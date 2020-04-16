# Skippy's Makefile for .dotfiles
DIR=$(shell pwd)

all: install

install:
	mkdir -p ~/.backup
	mkdir -p ~/bin
	#cp $(DIR)/miscfiles/scripts/* ~/bin

vim: install
	-mv -f ~/.vim ~/.backup
	-mv -f ~/.vimrc ~/.backup
	
	mkdir -p ~/.vim/autoload
	cp $(DIR)/miscfiles/plug.vim ~/.vim/autoload
	ln -s $(DIR)/.vimrc ~/.vimrc #Link to vimrc

bash: install
	#only uses simple config for now
	-mv -f ~/.bashrc ~/.backup
	
	ln -s $(DIR)/miscfiles/bash/.bashrc_1 ~/.bashrc

