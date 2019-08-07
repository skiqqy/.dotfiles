cd
mkdir -p .vim/autoload
cp ~/repos/.dotfilesMinimal/miscfiles/plug.vim ~/.vim/autoload

ln -s ~/repos/.dotfilesMinimal/.bashrc ~/.bashrc
ln -s ~/repos/.dotfilesMinimal/.vimrc ~/.vimrc
source .bashrc
