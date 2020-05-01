#!/bin/bash
# check that links are succesful

echo Starting Tests

make

if ! [[ -f ~/.bashrc && -f ~/.vimrc && -f ~/.zshrc && -f ~/.vim/autoload/plug.vim ]]; then
	exit 1
fi

make uninstall

if [[ -f ~/.backup/.vim || -f ~/.backup/.vimrc || -f ~/.backup/.bashrc || -f ~/.backup/.zshrc ]]; then
	exit 1
fi

echo "Testing vim install"
make vim
if ! [[ -f ~/.vimrc && -f ~/.vim/autoload/plug.vim ]]; then
	exit 1
fi

echo "Testing bash install"
make bash
if ! [[ -f ~/.bashrc ]]; then
	exit 1
fi

echo "Testing zsh"
make zsh
if ! [[ -f ~/.zshrc ]]; then
	exit 1
fi

echo "Cleaning up"
make uninstall
echo "Checking clean"
if [[ -f ~/.backup/.vim || -f ~/.backup/.vimrc || -f ~/.backup/.bashrc || -f ~/.backup/.zshrc ]]; then
	exit 1
fi

echo "Tests Completed"
