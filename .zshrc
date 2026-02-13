ZSH_THEME="gruvbox"
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Homebrew binaries
export PATH="/opt/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"

alias claude-mem='bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
alias claude-fntm='docker sandbox run claude-fntm'

alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
source /opt/homebrew/opt/spaceship/spaceship.zsh

# Spaceship prompt config
SPACESHIP_PROMPT_ORDER=(
  dir
  git
  node
  bun
  docker
  venv
  exec_time
  line_sep
  char
)
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_DIR_TRUNC=3
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=3

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
