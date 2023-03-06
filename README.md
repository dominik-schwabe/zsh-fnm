# ZSH Plugin - Fast Node Manager (fnm)

ZSH Plugin to install and load the [Fast Node Manager (fnm)](https://github.com/Schniz/fnm).

## Installation

### [Zi](https://github.com/z-shell/zi)

add the following to your `.zshrc`

```zsh
zi light "dominik-schwabe/zsh-fnm"
```

with configurations

```zsh
zi ice atinit'ZSH_FNM_NODE_VERSION=15.0.0'
zi light "dominik-schwabe/zsh-fnm"
```

with configurations + turbo mode

```zsh
zi ice wait lucid atinit'ZSH_FNM_NODE_VERSION=15.0.0'
zi light "dominik-schwabe/zsh-fnm"
```

## Configuration

### ZSH_FNM_NODE_VERSION

Set this environment variable to automatically install a node version and use it.  
e.g.

```zsh
export ZSH_FNM_NODE_VERSION="15.0.0"
```

### ZSH_FNM_ENV_EXTRA_ARGS

Pass extra arguments to `fnm env`.  
e.g.

```zsh
export ZSH_FNM_ENV_EXTRA_ARGS="--use-on-cd"
```

### ZSH_FNM_INSTALL_DIR

Set a fixed location where fnm gets installed.  
e.g.

```zsh
export ZSH_FNM_INSTALL_DIR="$HOME/.fnm"
```

## Similar Projects

- [zsh-nvm](https://github.com/lukechilds/zsh-nvm)

## Contributions

I don't use fnm anymore (i use [asdf](https://github.com/asdf-vm/asdf)) but since this project is so small and easy to maintain, any contributions are welcome.
