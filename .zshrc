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

ZSH_THEME="lambda"

plugins=(
  git
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

