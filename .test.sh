# check that links are succesful
if ! [[ -f ~/.bashrc && -f ~/.vimrc && -f ~/.zshrc && -f ~/.vim/autoload/plug.vim ]]; then
	exit 1
fi

make uninstall

if [[ -f ~/.backup/.vim || -f ~/.backup/.vimrc || -f ~/.backup/.bashrc || -f ~/.backup/.zshrc ]]; then
	exit 1
fi

echo "Tests Completed"
