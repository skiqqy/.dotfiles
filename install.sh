echo "### commands include ###"
echo " => all  = both vim and bashrc will be installed"
echo " => bash = only bashrc will be installed"
echo " => vim  = only vim will be installed"
echo "########################"
read var
cd

if [[ $var = all ]]; then
  echo "INSTALLING ALL"
  echo "CREATING BACKUPS IN ~/.tmp, moved .bashrc, .vim, .vimrc"
  mkdir bin
  mkdir .tmp
  mv .vim .vimrc .bashrc ~/.tmp

  mkdir -p .vim/autoload
  #mkdir -p .scripts/
  cp ~/repos/.dotfilesMinimal/miscfiles/scripts/* ~/bin
  chmod 700 ~/bin/*.sh
  cp ~/repos/.dotfilesMinimal/miscfiles/plug.vim ~/.vim/autoload

  ln -s ~/repos/.dotfilesMinimal/.bashrc ~/.bashrc
  ln -s ~/repos/.dotfilesMinimal/.vimrc ~/.vimrc
  source .bashrc
  echo "FINISHED INSTALLING BASHRC AND VIMRC"

elif [[ $var = bash ]]; then
  echo "INSTALLING ONLY BASH"
  echo "CREATING BACKUPS IN ~/.tmp, moved .bashrc"
  mkdir .tmp
  mkdir bin
  cp ~/repos/.dotfilesMinimal/miscfiles/scripts/* ~/bin
  chmod 700 ~/bin/*.sh
  mv .bashrc ~/.tmp

  ln -s ~/repos/.dotfilesMinimal/.bashrc ~/.bashrc
  source .bashrc
  echo "FINISHED INSTALLING BASHRC"

elif [[ $var = vim ]]; then
  echo "INSTALLING ONLY VIM"
  echo "CREATING BACKUPS IN ~/.tmp, moved .vim, .vimrc"
  mkdir .tmp
  mv .vim .vimrc ~/.tmp

  mkdir -p .vim/autoload
  cp ~/repos/.dotfilesMinimal/miscfiles/plug.vim ~/.vim/autoload
  ln -s ~/repos/.dotfilesMinimal/.vimrc ~/.vimrc
  echo "FINISHED INSTALLING VIM SETUP"
else echo "Not a valid argument, install failed"
fi
