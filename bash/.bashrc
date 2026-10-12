# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases

# Editor(s)
alias emacs='emacsclient -c -a ""'
alias vim='nvim'
alias tmacs='emacsclient -t'

# Eza
alias ls='tzst_eza_build --icons always'
alias ll='tzst_eza_build -lhAobn --no-permissions --group-directories-first --icons always'
alias tree='tzst_eza_build --tree --icons always'

# Other
alias grep='rg --color=auto'
alias diff='diff --color-auto'
alias cat='bat'
alias find='fd'
alias cd='z'
alias rm='rm -Iv'
alias cp='cp -v'
alias pacsrch="pacman -Ss --color=always | paste -d ' ' - - | fzf --ansi --height 95% --preview 'pacman -Si {1}' --preview-window=right:50%:wrap"

# Zoxide
eval "$(zoxide init bash)"

# Starship prompt
if [[ "$(tty)" == /dev/tty[0-9]* ]]; then
    PS1='\[\e[38;5;39m\]\w\n\[\e[38;5;189m\]>\[\e[0m\] '
else
    eval "$(starship init bash)"
fi
