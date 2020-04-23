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
	-rm -rf ~/.backup/.vim # only backup the latest .vim directory
	-mv -f ~/.vim ~/.backup
	-mv -f ~/.vimrc ~/.backup
	touch ~/.backup/.dfVIM # Let's us know that vim configs was installed
	# link files, and copy requirments
	mkdir -p ~/.vim/autoload
	cp $(DIR)/miscfiles/plug.vim ~/.vim/autoload
	ln -s $(DIR)/.vimrc ~/.vimrc # Link to vimrc

# Intall Bash configs
bash: install
	# only uses simple config for now
	-mv -f ~/.bashrc ~/.backup
	touch ~/.backup/.dfBASH # Let's us know that bash configs was installed
	# link files
	ln -s $(DIR)/miscfiles/bash/.bashrc_1 ~/.bashrc

# Install zsh configs
zsh: install
	-mv -f ~/.zshrc ~/.backup
	touch ~/.backup/.dfZSH # Let's  us know that zsh configs was installed
	# link files
	ln -s $(DIR)/miscfiles/zsh/.zshrc_1 ~/.zshrc

# Vim dependencies
powerline-fonts:
	#install powerline-fonts
	git clone https://github.com/powerline/fonts.git --depth=3
	./fonts/install.sh
	rm -rf fonts

# Uninstall, and revert to previous configs
uninstall: install
	# Check vim status, and do backup if needed
	-@if [ -f ~/.backup/.dfVIM ]; then\
		rm -rf ~/.backup/.dfVIM;\
		rm -rf ~/.vim;\
		rm -rf ~/.vimrc;\
		mv -f ~/.backup/.vim ~/;\
		mv -f ~/.backup/.vimrc ~/;\
	fi
	# Check bash status, and do backup if needed
	-@if [ -f ~/.backup/.dfBASH ]; then\
		rm -rf ~/.backup/.dfBASH;\
		rm -rf ~/.bashrc;\
		mv -f ~/.backup/.bashrc ~/;\
		#lastly, loop through and delete scripts in ~/bin
		for file in $(DIR)/miscfiles/scripts/*\
		do\
			rm -f ~/bin/$${file};\
		done\
		#delete ~/bin if it is empty
		if [ ! "ls -A ~/bin" ]; then\
			echo "Deleting ~/bin, since it is empty"
			rm -rf ~/bin;\
		fi\
	fi
	# Check zsh status, and fo backup if needed
	-@if [ -f ~/.backup/.dfZSH ]; then\
		rm -rf ~/.backup/.dfZSH;\
		rm -rf ~/.zshrc;\
		mv -f ~/.backup/.zshrc ~/;\
	fi

test: all
	bash .test.sh

testuninstall: uninstall
	bash .testuninstall.sh
