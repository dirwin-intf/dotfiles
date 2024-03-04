pdf:
	pandoc -o 2024-accomplishments-irwin.pdf 2024-accomplishments.md

propagate:
	/bin/bash ./update-dotfiles.sh
