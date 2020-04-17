# Skippy's Makefile for .dotfiles
DIR=$(shell pwd)

# Default install
all: setupbin bin install vim bash zsh

# Preamble for bin
setupbin:
	mkdir -p ~/bin
	cp $(DIR)/miscfiles/scripts/* ~/bin
	-rm -f ~/bin/upd

# Sets up custom updating script based on install location
bin:
	$(shell echo "INSTALL_LOC=$(PWD)" > ~/bin/upd)
	$(shell cat $(DIR)/miscfiles/scripts/upd >> ~/bin/upd)
	chmod +x ~/bin/*

# Make backup directory, and setup update script
install:
	mkdir -p ~/.backup

# Install vim configs
vim: install powerline-fonts
	-rm -rf ~/.backup/.vim #only backup the latest .vim directory
	-mv -f ~/.vim ~/.backup
	-mv -f ~/.vimrc ~/.backup
	#link files, and copy requirments
	mkdir -p ~/.vim/autoload
	cp $(DIR)/miscfiles/plug.vim ~/.vim/autoload
	ln -s $(DIR)/.vimrc ~/.vimrc #Link to vimrc

# Intall Bash configs
bash: install
	#only uses simple config for now
	-mv -f ~/.bashrc ~/.backup
	#link files
	ln -s $(DIR)/miscfiles/bash/.bashrc_1 ~/.bashrc

# Install zsh configs
zsh: install
	-mv -f ~/.zshrc ~/.backup
	#link files
	ln -s $(DIR)/miscfiles/zsh/.zshrc_1 ~/.zshrc

# Vim dependencies
powerline-fonts:
	#install powerline-fonts
	git clone https://github.com/powerline/fonts.git --depth=3
	./fonts/install.sh
	rm -rf fonts

# Uninstall, and revert to previous configs
uninstall: install
	-rm -rf ~/.vim
	-rm -rf ~/.vimrc
	-rm -rf ~/.bashrc
	-rm -rf ~/.zshrc
	#restore
	-mv -f ~/.backup/.bashrc ~/
	-mv -f ~/.backup/.vim ~/
	-mv -f ~/.backup/.vimrc ~/
	-mv -f ~/.backup/.zshrc ~/

test: all
	bash .test.sh
