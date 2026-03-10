# Uso de powerline
USE_POWERLINE="true"

# Alias importantes
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Detectar distribución
if [[ -f /etc/os-release ]]; then
  source /etc/os-release
  DISTRO=$ID
fi


# Configuración especifica para manjaro
if [[ "$DISTRO" == "manjaro" ]]; then
  # Has weird character width
  # Example:
  #    is not a diamond
  HAS_WIDECHARS="false"
  # Source manjaro-zsh-configuration
  if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
    source /usr/share/zsh/manjaro-zsh-config
  fi
  # Use manjaro zsh prompt
  if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
    source /usr/share/zsh/manjaro-zsh-prompt
  fi
fi
