# path stuff
export PATH="/Library/TeX/texbin:/usr/local/bin:/usr/local/sbin${PATH+:$PATH}";
export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/usr/local/share/info:${INFOPATH:-}";

# homebrew
export HOMEBREW_PREFIX="/usr/local";
export HOMEBREW_CELLAR="/usr/local/Cellar";
export HOMEBREW_REPOSITORY="/usr/local/Homebrew";

# makefile completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pull in aliases/custom functions
source ~/.bash_aliases
source ~/dotfiles/git-prompt.sh

# terminal prompt
export PS1='[\[\e[38;5;227m\]\@\[\e[0m\]]\[\e[38;5;147m\]\u\[\e[38;5;231m\]@\[\e[0m\](\[\e[38;5;48m\]\h\[\e[0m\]:\[\e[38;5;123m\]\w\[\e[0m\]$(__git_ps1 "|󰘬 %s"))\n  > '
