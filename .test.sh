# check that links are succesful
if ! [[ -f ~/.bashrc && -f ~/.vimrc && -f ~/.zshrc && -f ~/.vim/autoload/plug.vim ]]; then
	exit 1
fi
echo "Tests Completed"
