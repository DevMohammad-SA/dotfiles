#
# ~/.bashrc
#
# ─── ble.sh: Syntax Highlighting + Auto-Suggestions ─────────
# This line MUST be at the TOP of your .bashrc
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

~/.scripts/motd.sh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \w] \n$ '
#export PATH="$HOME/.npm-global/bin:$PATH"
# ─── Enable Colors ───────────────────────────────────────────
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Force color support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# ─── Colorized Aliases ──────────────────────────────────────
alias ls='ls --color=auto'
alias ll='ls -lAh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# ─── Fancy Color Prompt ─────────────────────────────────────
# Format: [user@host ~/path] (git-branch) $
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "

# ─── Colored Man Pages ──────────────────────────────────────
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# ─── Enhanced Tab Completion ─────────────────────────────────
# Case-insensitive completion
bind "set completion-ignore-case on"

# Show all matches on ambiguous completion (no double-tab needed)
bind "set show-all-if-ambiguous on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Color completion results (like ls)
bind "set colored-stats on"

# Append a slash to completed directory names
bind "set mark-directories on"
bind "set mark-symlinked-directories on"

# Show file type indicator in completions (like ls -F)
bind "set visible-stats on"

# Enable bash-completion package (if installed)
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# This line MUST be at the BOTTOM of your .bashrc
[[ ${BLE_VERSION-} ]] && ble-attach
