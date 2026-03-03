# ---- Local overrides ----
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ---- Environment ----
export PATH="$HOME/.npm-global/bin:$PATH"
export GPG_TTY="$(tty)"

# Editor selection
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ---- Aliases ----
alias eza='eza --icons --group-directories-first'
alias ezaf='eza -lh --icons --group-directories-first'
alias ezaa='eza -lha --icons --group-directories-first'
alias tree='eza --tree --icons'
alias zshconfig="$EDITOR ~/.zshrc"

# ---- History ----
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY INC_APPEND_HISTORY

# ---- Completion (fast) ----
autoload -Uz compinit
# Use cached completion dump; rebuild only if needed
compinit -C

# ---- ssh-agent (optional; keep if you use it) ----
if [[ -z "$SSH_AUTH_SOCK" ]] && ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)" >/dev/null
fi
export KEYTIMEOUT=40   
# ---- Plugins (no OMZ) ----
# Install these via pacman (see below), then source them:
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Must be sourced near the end
[[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Prompt ----
venv_prompt() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "[$(basename $VIRTUAL_ENV)] "
  fi
}


git_prompt() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local branch dirty

    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)

    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      dirty=" %F{red}*%f"
    fi

    echo "[$branch$dirty] "
  fi
}

ip_prompt() {
  ip=$(ip route get 1 | awk '{print $7; exit}')
  echo "$ip"
}

autoload -U colors && colors
setopt PROMPT_SUBST

PROMPT='%F{green}$(venv_prompt)%f%F{cyan}%n@%m%f %F{blue}%~%f $(git_prompt)%f %F{white}$(ip_prompt)%f
%# '
#eval "$(starship init zsh)"
