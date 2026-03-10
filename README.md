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

Antes de instalar los dotfiles es necesario tener instaladas algunas herramientas.

## Zsh

Instalar **Oh My Zsh**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Plugins utilizados:

* `git`

Tema utilizado:

* `eastwood`

---

## Tmux

Instalar **TPM (Tmux Plugin Manager)**

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Plugins utilizados:

* `tmux-plugins/tpm`
* `catppuccin/tmux`

---

# Instalación

Este repositorio utiliza la técnica de **bare repository** para administrar dotfiles.

## 1 Clonar repositorio

```bash
git clone --bare https://github.com/Aliv-pr/dotfiles.git $HOME/.dotfiles
```

## 2 Crear alias para administrar dotfiles

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

## 3 Ocultar archivos no rastreados

```bash
dotfiles config --local status.showUntrackedFiles no
```

## 4 Aplicar configuración

```bash
dotfiles checkout
```

Si existen conflictos con archivos existentes:

```bash
mkdir -p .dotfiles-backup

dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .dotfiles-backup/{}

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

## Cambios principales

### Prefijo

El prefijo por defecto cambia de:

```
C-b → C-s
```

---

### Recargar configuración

```
prefix + r
```

Permite recargar `.tmux.conf` sin reiniciar tmux.

---

### Navegación entre paneles

Movimiento estilo **Vim**:

```
prefix + h   mover izquierda
prefix + j   mover abajo
prefix + k   mover arriba
prefix + l   mover derecha
```

---

### Splits

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

### Mouse

El soporte de mouse está habilitado.

---

### Terminal

Se utiliza:

```
tmux-256color
```

Para mejorar compatibilidad con colores.

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

# Configuración de teclado

Esta sección documenta los cambios de teclado importantes introducidos por la configuración.

---

# Tmux Keybindings

## Prefijo

El prefijo por defecto de tmux cambia de:

```
Ctrl + b
```

a:

```
Ctrl + s
```

Esto permite acceder más fácilmente a los comandos de tmux.

---

## Recargar configuración

Recargar `.tmux.conf` sin reiniciar tmux.

```
prefix + r
```

Ejemplo:

```
Ctrl+s r
```

---

## Navegación entre paneles

La navegación entre paneles sigue el estilo **Vim**.

| Acción               | Teclas       |
| -------------------- | ------------ |
| Mover a la izquierda | `prefix + h` |
| Mover abajo          | `prefix + j` |
| Mover arriba         | `prefix + k` |
| Mover a la derecha   | `prefix + l` |

Ejemplo:

```
Ctrl+s h
```

---

## Crear paneles (splits)

Los paneles se crean manteniendo el directorio actual.

| Acción           | Teclas        |
| ---------------- | ------------- |
| Split horizontal | `prefix + -`  |
| Split vertical   | `prefix + \|` |

Ejemplo:

```
Ctrl+s -
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

El tema utilizado es **Catppuccin (Mocha)** con:

* barra de estado superior
* ventanas con estilo redondeado
* módulos de estado para sesión y aplicación

---

# Plugins usados

## Tmux

```
tmux-plugins/tpm
catppuccin/tmux
```

## Zsh

```
git
```

---

# Alias importantes

Alias para administrar los dotfiles:

```
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Uso:

```
dotfiles status
dotfiles add .
dotfiles commit
dotfiles push
```
