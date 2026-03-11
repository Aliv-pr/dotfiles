# Dotfiles

Configuración personal para mi entorno de desarrollo en Linux y WSL.

Repositorio:
https://github.com/Aliv-pr/dotfiles

El objetivo es mantener un entorno consistente entre diferentes sistemas:

* Manjaro
* Fedora
* Ubuntu (WSL)

Actualmente incluye configuración para:

* **Zsh**
* **Tmux**

---

# Requisitos (Dependencies)

Antes de instalar los dotfiles es necesario instalar algunas herramientas.

---

# Zsh

## Instalar Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

## Plugins utilizados

La configuración de Zsh utiliza los siguientes plugins:

* `git`
* `zsh-autosuggestions`
* `zsh-syntax-highlighting`

---

## Instalar plugins

```bash
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```bash
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

---

## Tema utilizado

Tema de Oh My Zsh:

```
eastwood
```

---

# Tmux

## Instalar TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Plugins utilizados:j

* `tmux-plugins/tpm`
* `catppuccin/tmux`

---

# Instalación

Este repositorio utiliza la técnica de **bare repository** para administrar dotfiles.

---

## 1 Clonar repositorio

```bash
git clone --bare https://github.com/Aliv-pr/dotfiles.git $HOME/.dotfiles
```

---

## 2 Crear alias para administrar dotfiles

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

---

## 3 Ocultar archivos no rastreados

```bash
dotfiles config --local status.showUntrackedFiles no
```

---

## 4 Aplicar configuración

```bash
dotfiles checkout
```

---

## Resolver conflictos (si existen)

Si ya existen archivos en el sistema que entren en conflicto:

```bash
mkdir -p .dotfiles-backup
```

```bash
dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .dotfiles-backup/{}
```

```bash
dotfiles checkout
```

---

# Archivos incluidos

```
.
├── .tmux.conf
└── .zshrc
```

---

# Configuración de Zsh

Archivo:

```
.zshrc
```

---

## Características

La configuración incluye:

* detección automática de distribución
* integración con Oh My Zsh
* alias para administrar dotfiles
* configuraciones específicas por sistema

---

## Detección de sistema operativo

Se detecta la distribución usando:

```
/etc/os-release
```

Esto permite aplicar configuraciones específicas dependiendo del sistema.

---

## Alias importantes

Alias para administrar los dotfiles:

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Uso:

```
dotfiles status
dotfiles add
dotfiles commit
dotfiles push
```

---

## Configuración específica

Para **Manjaro**:

```
HAS_WIDECHARS="false"
```

Esto evita problemas de renderizado en algunos prompts.

---

# Configuración de Tmux

Archivo:

```
.tmux.conf
```

---

## Prefijo

El prefijo por defecto cambia de:

```
C-b
```

a:

```
C-s
```

---

## Recargar configuración

Permite recargar `.tmux.conf` sin reiniciar tmux.

```
prefix + r
```

Ejemplo:

```
Ctrl+s r
```

---

## Navegación entre paneles

Movimiento estilo **Vim**:

```
prefix + h   mover izquierda
prefix + j   mover abajo
prefix + k   mover arriba
prefix + l   mover derecha
```

---

## Splits

Los paneles se crean manteniendo el directorio actual.

Horizontal:

```
prefix + -
```

Vertical:

```
prefix + |
```

---

## Instalación de plugins

Instalar plugins de tmux con:

```
prefix + I
```

---

# Mouse

El soporte de mouse está habilitado en tmux.

Esto permite:

* seleccionar paneles con el mouse
* redimensionar paneles
* seleccionar texto

---

# Terminal

La configuración usa:

```
tmux-256color
```

para mejorar la compatibilidad con colores.

---

# Tema

Tmux utiliza el tema **Catppuccin** con las siguientes opciones:

* flavor: `mocha`
* barra de estado superior
* ventanas con bordes redondeados

---

# Barra de estado

La barra muestra:

* aplicación activa
* sesión de tmux
* fecha y hora

Se actualiza cada:

```
5 segundos
```

Posición:

```
top
```

---

# Actualizar dotfiles

Agregar cambios:

```bash
dotfiles add .
```

Crear commit:

```bash
dotfiles commit -m "update config"
```

Subir cambios:

```bash
dotfiles push
```

---

# Objetivo del repositorio

Mantener un entorno reproducible entre diferentes sistemas sin duplicar configuraciones.

