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

# ---- Keybindings ----
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# ---- Aliases ----
alias zshconfig="$EDITOR ~/.zshrc"

alias ls='ls --color=auto'
alias ll='ls -lAh --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias eza='eza --icons --group-directories-first'
alias ezaf='eza -lh --icons --group-directories-first'
alias ezaa='eza -lha --icons --group-directories-first'
alias tree='eza --tree --icons'

# Optional modern ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first'
  alias ll='eza -lh --group-directories-first'
  alias tree='eza --tree'
fi

# ---- History ----
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY INC_APPEND_HISTORY

# ---- Completion (fast) ----
autoload -Uz compinit
# Use cached completion dump; rebuild only if needed
compinit -C

if [[ -z "$SSH_AUTH_SOCK" ]] && ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)" >/dev/null
fi
export KEYTIMEOUT=40   
# ---- Prompt ----
autoload -U colors && colors
setopt PROMPT_SUBST
venv_prompt() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "[$(basename $VIRTUAL_ENV)] "
  fi
}
git_prompt() {
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

    if [[ -n "$dirty" ]]; then
      echo " %K{238}%F{cyan}[${branch}%F{red}${dirty}%F{cyan}]%f%k"
    else
      echo " %K{238}%F{cyan}[${branch}] %f%k"
    fi
}
ip_prompt() {
  ip=$(ip route get 1 | awk '{print $7; exit}')
  echo "$ip"
}


PROMPT='%F{green}$(venv_prompt)%f\
%F{cyan}%n@%m%f \
%F{blue}%~%f$(git_prompt) \
%F{white}$(ip_prompt)%f
%# '

#eval "$(starship init zsh)"


# ---- Plugins (no OMZ) ----
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Must be sourced near the end
[[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

