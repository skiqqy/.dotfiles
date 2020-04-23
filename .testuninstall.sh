#!/bin/bash
# Checks that configs where uninstalled.
if [[ -f ~/.backup/.vim || -f ~/.backup/.vimrc || -f ~/.backup/.bashrc || -f ~/.backup/.zshrc ]]; then
	exit 1
fi

echo "Uninstall test completed"
