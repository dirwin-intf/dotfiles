HOME=/Users/irwind1
pdf:
	pandoc -o 2024-accomplishments-irwin.pdf 2024-accomplishments.md

updates:
	/bin/bash ./update-dotfiles.sh && source $(HOME)/.bashrc
