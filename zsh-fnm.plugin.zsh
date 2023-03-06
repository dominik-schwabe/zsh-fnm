# this is copied from the install script: https://fnm.vercel.app/install
if [ -z $ZSH_FNM_INSTALL_DIR ]; then
    if [ -d "$HOME/.fnm" ]; then
      ZSH_FNM_INSTALL_DIR="$HOME/.fnm"
    elif [ -n "$XDG_DATA_HOME" ]; then
      ZSH_FNM_INSTALL_DIR="$XDG_DATA_HOME/fnm"
    elif [ "$(uname -s)" = "Darwin" ]; then
      ZSH_FNM_INSTALL_DIR="$HOME/Library/Application Support/fnm"
    else
      ZSH_FNM_INSTALL_DIR="$HOME/.local/share/fnm"
    fi
fi

_install_fnm() {
    FNM_INSTALL_URL="https://fnm.vercel.app/install"

    FNM_INSTALL_SCRIPT=$(curl -fsSL $FNM_INSTALL_URL 2>/dev/null) \
        || FNM_INSTALL_SCRIPT=$(wget -qO- $FNM_INSTALL_URL 2>/dev/null) \
        || {echo "curl or wget required to install fnm"; return 1}

    bash -s -- --skip-shell --install-dir "$ZSH_FNM_INSTALL_DIR" <<< $FNM_INSTALL_SCRIPT || return 1
    return 0
}

command -v fnm &>/dev/null || {
    export PATH=$ZSH_FNM_INSTALL_DIR:$PATH
    command -v fnm &>/dev/null || _install_fnm
}

eval "$(fnm env $ZSH_FNM_ENV_EXTRA_ARGS)"

if [ -n "$ZSH_FNM_NODE_VERSION" ]; then
    if ! fnm use $ZSH_FNM_NODE_VERSION &>/dev/null; then
        echo "node version $ZSH_FNM_NODE_VERSION not present"
        echo "trying to install version $ZSH_FNM_NODE_VERSION"
        if fnm install $ZSH_FNM_NODE_VERSION; then
            if ! fnm use $ZSH_FNM_NODE_VERSION; then
                echo "$ZSH_FNM_NODE_VERSION not found"
            fi
        fi
    fi
fi

fpath+="${0:h}/completion"
