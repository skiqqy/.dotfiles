# Skippy's Makefile for .dotfiles
DIR=$(shell pwd)

# Default install
all: setupbin bin install vim bash zsh

submods:
	# Update submodules
	git submodule init
	git submodule update

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
	-@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
			|| \
			echo "Curl failed, resulting to emergency plug.vim" && \
			mkdir -p ~/.vim/autoload  && \
			cp $(DIR)/miscfiles/plug.vim ~/.vim/autoload
	#mkdir -p ~/.vim/autoload
	#cp $(DIR)/miscfiles/plug.vim ~/.vim/autoload
	ln -s $(DIR)/.vimrc ~/.vimrc # Link to vimrc
	vim -c PlugInstall -c q -c q

# Intall Bash configs
bash: install
	# only uses simple config for now
	-mv -f ~/.bashrc ~/.backup
	touch ~/.backup/.dfBASH # Let's us know that bash configs was installed
	# link files
	-rm -f $(DIR)/.bashrc_local # We are creating a new one.
	-@cat $(DIR)/miscfiles/bash/.bashrc_1 > $(DIR)/.bashrc_local
	ln -s $(DIR)/.bashrc_local ~/.bashrc

cbash: submods
	# Handle system info.
	-@echo -n "enable system info (aka neofetch/pfetch), [y/n]: "; \
		read ans; \
		if [ $$ans = "y" ]; then \
			echo "The following are available:"; \
			echo "----------------------------"; \
			echo "(n)eofetch"; \
			echo "(p)fetch"; \
			echo "----------------------------"; \
			echo -n "Please select a letter: "; \
			read ans; \
			case $$ans in \
				"n") \
					echo "Neofetch chosen."; \
					echo "neofetch" >> "$(DIR)/.bashrc_local"; \
					;; \
				"p") \
					echo "pfetch chosen."; \
					echo "$(DIR)/submodules/pfetch/pfetch" >> "$(DIR)/.bashrc_local"; \
					;; \
				*) \
					echo "Error, Invalid Selection."; \
			esac; \
		fi
	# Setup thefuck
	-@echo -n "enable thefuck? (y/n): ";\
		read ans; \
		if [ $$ans = "y" ]; then \
			echo "eval \"\$$(thefuck --alias)\"" >> $(DIR)/.bashrc_local; \
		fi

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
	-@if [ -f ~/.backup/.dfVIM ]; then \
		rm -rf ~/.vim; \
		rm -rf ~/.vimrc; \
		mv -f ~/.backup/.vim ~/; \
		mv -f ~/.backup/.vimrc ~/; \
		echo "vim uninstall succsesful!"; \
		rm -rf ~/.backup/.dfVIM; \
	fi
	# Check bash status, and do backup if needed
	-@if [ -f ~/.backup/.dfBASH ]; then \
		rm -rf ~/.bashrc; \
		mv -f ~/.backup/.bashrc ~/; \
		for file in $(DIR)/miscfiles/scripts/* ; do \
			rmf=$${file##*/}; \
			rm -f ~/bin/$$rmf; \
		done;\
		if [ ! "ls -A ~/bin" ]; then \
			echo "Deleting ~/bin, since it is empty"; \
			rm -rf ~/bin; \
		fi;\
		rm -rf ~/.backup/.dfBASH; \
	fi
	# Check zsh status, and fo backup if needed
	-@if [ -f ~/.backup/.dfZSH ]; then \
		rm -rf ~/.zshrc; \
		mv -f ~/.backup/.zshrc ~/; \
		rm -rf ~/.backup/.dfZSH; \
	fi

test:
	bash .test.sh
