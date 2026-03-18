# -----------------------------
# Detectar distribución
# -----------------------------
if [[ -f /etc/os-release ]]; then
  source /etc/os-release
  DISTRO=$ID
fi

# -----------------------------
# Alias importantes
# -----------------------------
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# -----------------------------
# Powerline
# -----------------------------
USE_POWERLINE="true"

# -----------------------------
# Oh My Zsh
# -----------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [[ -d "$ZSH" ]]; then
  source $ZSH/oh-my-zsh.sh
fi

# -----------------------------
# Configuración específica
# -----------------------------

# Manjaro
if [[ "$DISTRO" == "manjaro" ]]; then
  HAS_WIDECHARS="false"
fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:$HOME/go/bin
