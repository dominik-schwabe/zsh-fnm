_install_fnm() {
    FNM_INSTALL_URL="https://fnm.vercel.app/install"

    FNM_INSTALL_SCRIPT=$(curl -fsSL $FNM_INSTALL_URL 2>/dev/null) \
    || FNM_INSTALL_SCRIPT=$(wget -qO- $FNM_INSTALL_URL 2>/dev/null) \
    || {echo "curl or wget required to install fnm"; return 1}

    bash -s -- --skip-shell <<< $FNM_INSTALL_SCRIPT || return 1
    return 0
}

command -v fnm &>/dev/null || {
    export PATH=$HOME/.fnm:$PATH
    command -v fnm &>/dev/null || _install_fnm
}

eval "$(fnm env)"

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
