# Dotfiles Configuration (Bare Git Repository)

Este repositorio contiene mis **archivos de configuración personales (dotfiles)** administrados usando un **repositorio bare de Git**.
El objetivo es poder **versionar configuraciones como `.tmux.conf`, `.zshrc`, `nvim`, etc. sin tener que mover los archivos de su ubicación original**.

Este método permite que las aplicaciones sigan encontrando los archivos **exactamente donde los esperan** y facilita replicar la configuración en diferentes computadoras.

---

# Concepto

Normalmente, un repositorio de Git tiene esta estructura:

```
proyecto/
├── .git
└── archivos_del_proyecto
```

Pero en este caso se utiliza un **repositorio bare**, que solo contiene la base de datos de Git.

```
~/.dotfiles/
├── HEAD
├── config
├── objects
└── refs
```

La idea es separar:

```
Repositorio Git → ~/.dotfiles
Working tree   → ~ (home del usuario)
```

Esto significa que **Git controla archivos dentro del home**, pero el repositorio vive separado.

Ejemplo:

```
~
├── .tmux.conf
├── .zshrc
├── .gitconfig
├── .config/
│   └── nvim
└── .dotfiles/
```

---

# Ventajas de este método

* No se usan **symlinks**
* Los archivos permanecen en su ubicación real
* Solo se versionan los archivos que se agregan explícitamente
* Funciona fácilmente en múltiples computadoras
* Permite mantener configuraciones sincronizadas mediante GitHub

---

# Configuración inicial

## 1. Crear repositorio bare

```
git init --bare $HOME/.dotfiles
```

---

## 2. Crear alias para usar Git con los dotfiles

```
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Este alias permite usar `dotfiles` como si fuera `git`.

Ejemplo:

```
dotfiles status
```

---

## 3. Ocultar archivos no rastreados

El home tiene miles de archivos, por lo que se configura Git para ignorarlos en `status`.

```
dotfiles config --local status.showUntrackedFiles no
```

Esto hace que solo aparezcan los archivos que realmente están versionados.

---

# Agregar archivos de configuración

Ejemplo agregando `.tmux.conf`:

```
dotfiles add ~/.tmux.conf
dotfiles commit -m "Add tmux configuration"
```

Otros ejemplos comunes:

```
dotfiles add ~/.zshrc
dotfiles add ~/.gitconfig
dotfiles add ~/.config/nvim
```

---

# Conectar con GitHub

Agregar repositorio remoto:

```
dotfiles remote add origin https://github.com/Aliv-pr/dotfiles.git
```

Renombrar rama principal:

```
dotfiles branch -M main
```

Subir repositorio:

```
dotfiles push -u origin main
```

Después de esto solo será necesario usar:

```
dotfiles push
```

---

# Flujo normal de trabajo

Cuando se modifica algún archivo de configuración:

```
dotfiles add <archivo>
dotfiles commit -m "Descripción del cambio"
dotfiles push
```

Ejemplo:

```
dotfiles add ~/.tmux.conf
dotfiles commit -m "Update tmux keybindings"
dotfiles push
```

---

# Instalar dotfiles en otra computadora

1. Clonar el repositorio bare:

```
git clone --bare https://github.com/Aliv-pr/dotfiles.git $HOME/.dotfiles
```

2. Crear alias:

```
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

3. Aplicar configuraciones:

```
dotfiles checkout
```

4. Ocultar archivos no rastreados:

```
dotfiles config --local status.showUntrackedFiles no
```

Esto restaurará automáticamente todos los archivos versionados en el home.

---

# Posibles conflictos

Si un archivo ya existe en el sistema, Git no lo sobrescribirá automáticamente.

Ejemplo de error:

```
error: The following untracked working tree files would be overwritten
```

Solución:

```
mv ~/.tmux.conf ~/.tmux.conf.backup
dotfiles checkout
```

---

# Archivos comunes en este repositorio

Configuraciones típicas que se versionan:

```
.tmux.conf
.zshrc
.gitconfig
.config/nvim
.config/kitty
.config/alacritty
```

Archivos que normalmente **no se versionan**:

```
.cache
.local/share
Downloads
```

---

# Notas

Este repositorio permite mantener **todas mis configuraciones sincronizadas entre diferentes máquinas** usando Git.

Solo es necesario recordar que:

* El repositorio vive en `~/.dotfiles`
* Los archivos reales viven en `~`
* Se usa el comando `dotfiles` en lugar de `git`

