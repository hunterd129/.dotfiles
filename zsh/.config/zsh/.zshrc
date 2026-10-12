# =========================================================
# History
# =========================================================

HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
FUNCNEST=100

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT
walls="$HOME/Pictures/Wallpapers"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# zoxide
eval "$(zoxide init zsh)"

# =========================================================
# Fuzzy finder
# =========================================================

if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# UI
export FZF_DEFAULT_OPTS='
  --height=100%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden

# =========================================================
# Smart directory navigation & lf
# =========================================================

if [[ -f ~/.config/lf/icons ]]; then
	LF_ICONS=$(cat ~/.config/lf/icons | tr '\n' ':')
	export LF_ICONS
fi

# =========================================================
# Completion
# =========================================================
autoload -Uz compinit

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =========================================================
# Aliases
# =========================================================

# Editor(s)
alias emacs='emacsclient -c -a ""'
alias vim='nvim'
alias tmacs='emacsclient -t'

# Eza
alias ls='tzst_eza_build --icons always'
alias ll='tzst_eza_build -lhAobn --no-permissions --group-directories-first --icons always'
alias tree='tzst_eza_build --tree --icons always'

# Reuse ls completions for eza
compdef eza=ls

# Other
alias grep='rg --color=auto'
alias diff='diff --color-auto'
alias cat='bat'
alias find='fd'
alias cd='z'
alias rm='rm -Iv'
alias cp='cp -v'
alias pacsrch="pacman -Ss --color=always | paste -d ' ' - - | fzf --ansi --height 95% --preview 'pacman -Si {1}' --preview-window=right:50%:wrap"

# ---------- PATH ----------

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# =========================================================
# Appearance
# =========================================================

# Context aware prompt
if [[ "$(tty)" == /dev/tty[0-9]* ]]; then
	PROMPT=$'%K{black}%F{cyan}%~%k%f\n%F{white}>%f '
else
	eval "$(starship init zsh)"
fi

# ZSH-Vi-Mode cursor overrides
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK


