cd
mkdir -p .vim/autoload
mkdir -p .scripts/
cp ~/repos/.dotfilesMinimal/miscfiles/Workspace.sh ~/.scripts
cp ~/repos/.dotfilesMinimal/miscfiles/plug.vim ~/.vim/autoload

ln -s ~/repos/.dotfilesMinimal/.bashrc ~/.bashrc
ln -s ~/repos/.dotfilesMinimal/.vimrc ~/.vimrc
source .bashrc
