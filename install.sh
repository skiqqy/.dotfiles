echo "### commands include ###"
echo "Note, if bash is selected, you will be asked for a profile, if incorrect input, the defualt is chosen"
echo " => all  = both vim and bashrc will be installed"
echo " => bash = only bashrc will be installed"
echo " => vim  = only vim will be installed"
echo "########################"
printf "command: "
read var
cd

if [[ $var = all ]]; then
  echo "INSTALLING ALL"
  echo "CREATING BACKUPS IN ~/.tmp, moved .bashrc, .vim, .vimrc"
  mkdir bin
  mkdir .tmp
  mv -r ~/.vim ~/.tmp
  mv ~/.vimrc ~/.tmp
  mv ~/.bashrc ~/.tmp

  printf "select bash profile, A OR B: "
  read profile
  if [[ $profile = B ]]; then
  	ln -s ~/repos/.dotfilesMinimal/miscfiles/bash/.bashrc_2 ~/.bashrc
  else
  	ln -s ~/repos/.dotfilesMinimal/miscfiles/bash/.bashrc_1 ~/.bashrc
  fi

  mkdir -p .vim/autoload
  #mkdir -p .scripts/
  cp ~/repos/.dotfilesMinimal/miscfiles/scripts/* ~/bin
  chmod 700 ~/bin/*.sh
  cp ~/repos/.dotfilesMinimal/miscfiles/plug.vim ~/.vim/autoload

  #ln -s ~/repos/.dotfilesMinimal/.bashrc ~/.bashrc
  #ln -s $profile ~/.bashrc
  ln -s ~/repos/.dotfilesMinimal/.vimrc ~/.vimrc
  source ~/.bashrc
  echo "FINISHED INSTALLING BASHRC AND VIMRC"

elif [[ $var = bash ]]; then
  echo "INSTALLING ONLY BASH"
  echo "CREATING BACKUPS IN ~/.tmp, moved .bashrc"
  mkdir .tmp
  mkdir bin
  cp ~/repos/.dotfilesMinimal/miscfiles/scripts/* ~/bin
  chmod 700 ~/bin/*.sh
  mv ~/.bashrc ~/.tmp

  printf "select bash profile, A OR B: "
  read profile
  if [[ $profile = B ]]; then
  	ln -s ~/repos/.dotfilesMinimal/miscfiles/bash/.bashrc_2 ~/.bashrc
  else
  	ln -s ~/repos/.dotfilesMinimal/miscfiles/bash/.bashrc_1 ~/.bashrc
  fi

  #ln -s ~/repos/.dotfilesMinimal/.bashrc ~/.bashrc
  #ln -s $profile ~/.bashrc
  source ~/.bashrc
  echo "FINISHED INSTALLING BASHRC"

elif [[ $var = vim ]]; then
  echo "INSTALLING ONLY VIM"
  echo "CREATING BACKUPS IN ~/.tmp, moved .vim, .vimrc"
  mkdir .tmp
  mv -r ~/.vim ~/.tmp
  mv ~/.vimrc ~/.tmp

  mkdir -p .vim/autoload
  cp ~/repos/.dotfilesMinimal/miscfiles/plug.vim ~/.vim/autoload
  ln -s ~/repos/.dotfilesMinimal/.vimrc ~/.vimrc
  echo "FINISHED INSTALLING VIM SETUP"
else echo "Not a valid argument, install failed"
fi

printf "Would You like to install powerline fonts (No sudo needed) Y/N: "
read pf

if [[ $pf = Y ]]; then
	cd
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts
	./install.sh
	cd ..
	rm -rf fonts
fi
