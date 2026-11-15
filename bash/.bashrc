# ~/.bashrc  (headless Debian servers)
# Per-host differences go in ~/.bashrc.local (sourced at the very end).

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

if [[ $__USE_COLOR == 1 ]] && command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────

if [[ $__USE_COLOR == 1 ]]; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias diff='diff --color=auto'
fi

alias ll='ls -lAh'

# ─────────────────────────────────────────────
# History
# ─────────────────────────────────────────────

HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth       # skip duplicates and commands starting with a space
HISTTIMEFORMAT='%F %T '      # timestamps in `history` output
shopt -s histappend          # append to the history file instead of overwriting it
shopt -s checkwinsize        # re-check window size after each command

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

# ─────────────────────────────────────────────
# Prompt
#
# Format:
#   [tag] user@host [ip]:path (git-branch*)
#   $
#
# PS1 is rebuilt before every prompt by __set_prompt (via PROMPT_COMMAND).
# $? is captured on the first line of that function, before any other
# command can overwrite it. That is what makes the red/blue symbol work.
#
# Optional variables (set them in ~/.bashrc.local):
#   PROMPT_TAG=prod     shows a yellow [prod] before user@host
#   PROMPT_SHOW_IP=1    shows the local IP after the hostname
# ─────────────────────────────────────────────

__set_prompt() {
  local last_status=$?   # must stay the first line

  # Colors. \[ \] tell readline these characters take no width.
  local c_reset="" c_user="" c_path="" c_ip="" c_red="" c_yellow="" c_branch="" c_sym=""
  if [[ $__USE_COLOR == 1 ]]; then
    c_reset='\[\033[0m\]'
    c_user='\[\033[36m\]'
    c_path='\[\033[34m\]'
    c_ip='\[\033[35m\]'
    c_red='\[\033[31m\]'
    c_yellow='\[\033[33m\]'
    c_branch='\[\033[36m\]'
  fi

  # Symbol color: red for root or a failed last command, blue otherwise
  if [[ $EUID -eq 0 || $last_status -ne 0 ]]; then
    c_sym=$c_red
  else
    c_sym='\[\033[34m\]'
    [[ $__USE_COLOR == 1 ]] || c_sym=""
  fi

  # Optional tag
  local tag_part=""
  [[ -n "${PROMPT_TAG:-}" ]] && tag_part="${c_yellow}[${PROMPT_TAG}]${c_reset} "

  # Optional IP (reads the address after "src" in the route output)
  local ip_part="" ip
  if [[ "${PROMPT_SHOW_IP:-0}" == 1 ]] && command -v ip >/dev/null 2>&1; then
    ip=$(ip route get 1.1.1.1 2>/dev/null |
      awk '{for (i = 1; i <= NF; i++) if ($i == "src") { print $(i + 1); exit }}')
    [[ -n "$ip" ]] && ip_part=" ${c_ip}${ip}${c_reset}"
  fi

  # Git branch: one `git status` call. Fails silently outside a repo.
  local git_part="" out branch dirty=""
  if command -v git >/dev/null 2>&1 && out=$(git status --porcelain -b 2>/dev/null); then
    branch=${out%%$'\n'*}     # first line: "## branch...upstream"
    branch=${branch#\#\# }
    branch=${branch%%...*}
    branch=${branch#No commits yet on }   # fresh repo with no commits
    [[ "$out" == *$'\n'* ]] && dirty="*"   # any further line means changes
    git_part=" (${c_branch}${branch}${c_red}${dirty}${c_reset})"
  fi

  # \$ prints # for root and $ for everyone else
  PS1="${tag_part}${c_user}\u@\h${c_reset}${ip_part}:${c_path}\w${c_reset}${git_part}\n${c_sym}\\\$${c_reset} "
}

# Prepend once, so re-sourcing the file doesn't add it twice
case ";${PROMPT_COMMAND:-};" in
  *";__set_prompt;"*) ;;
  *) PROMPT_COMMAND="__set_prompt${PROMPT_COMMAND:+;$PROMPT_COMMAND}" ;;
esac

# ─────────────────────────────────────────────
# Local overrides
# Keep this LAST so it can override everything above
# ─────────────────────────────────────────────

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

