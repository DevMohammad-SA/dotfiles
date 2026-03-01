# Exit if not interactive
[[ $- != *i* ]] && return

# ─────────────────────────────────────────────
# Color detection
# Disable if terminal doesn't support it
# ─────────────────────────────────────────────

__USE_COLOR=1

[[ -n "${NO_COLOR:-}" ]] && __USE_COLOR=0
[[ "${TERM:-}" == "dumb" ]] && __USE_COLOR=0

# ─────────────────────────────────────────────
# LS colors
# ─────────────────────────────────────────────

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

# ─────────────────────────────────────────────
# SSH Agent
# ─────────────────────────────────────────────

if [[ -z "$SSH_AUTH_SOCK" ]] && ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)" >/dev/null
fi
export KEYTIMEOUT=40
# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────

alias ls='ls --color=auto'
alias ll='ls -lAh --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Optional modern ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first'
  alias ll='eza -lh --group-directories-first'
  alias tree='eza --tree'
fi

# ─────────────────────────────────────────────
# Get local IP
# ─────────────────────────────────────────────

__prompt_ip() {

  command -v ip >/dev/null 2>&1 || return

  local ip

  ip=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $7; exit}')

  [[ -z "$ip" ]] && return

  if [[ $__USE_COLOR == 1 ]]; then
    printf " \033[35m%s\033[0m" "$ip"
  else
    printf " %s" "$ip"
  fi
}

# ─────────────────────────────────────────────
# Git branch display
# ─────────────────────────────────────────────

__prompt_git() {

  command -v git >/dev/null 2>&1 || return

  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

  local branch dirty=""

  branch=$(git symbolic-ref --short HEAD 2>/dev/null ||
    git rev-parse --short HEAD 2>/dev/null)

  if ! git diff --quiet 2>/dev/null ||
    ! git diff --cached --quiet 2>/dev/null ||
    [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
    dirty="*"
  fi

  if [[ $__USE_COLOR == 1 ]]; then

    if [[ -n "$dirty" ]]; then
      printf " (\033[36m%s\033[31m%s\033[0m)" "$branch" "$dirty"
    else
      printf " (\033[36m%s\033[0m)" "$branch"
    fi

  else

    printf " (%s%s)" "$branch" "$dirty"

  fi
}

# ─────────────────────────────────────────────
# Prompt symbol
# Blue success, Red failure
# ─────────────────────────────────────────────

__prompt_symbol() {

  if [[ $__USE_COLOR == 1 ]]; then

    if [[ $? == 0 ]]; then
      printf "\033[34m$\033[0m "
    else
      printf "\033[31m$\033[0m "
    fi

  else

    printf "$ "

  fi
}

# ─────────────────────────────────────────────
# Main prompt
# Format:
#
# user@host IP:path (git)
# $
# ─────────────────────────────────────────────

if [[ $__USE_COLOR == 1 ]]; then

  PS1="\[\033[36m\]\u@\h\[\033[0m\]\$(__prompt_ip):\[\033[34m\]\w\[\033[0m\]\$(__prompt_git)
\$(__prompt_symbol)"

else

  PS1="\u@\h\$(__prompt_ip):\w\$(__prompt_git)
\$ "

fi

export PS1

# ─────────────────────────────────────────────
# Completion
# ─────────────────────────────────────────────

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
elif [[ -r /etc/bash_completion ]]; then
  . /etc/bash_completion
fi
