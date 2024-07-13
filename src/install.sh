#!/bin/bash

# Get the script directory
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Declare associative array
declare -A installer

installer.unit() {
    installer['bin']=$HOME'/bin'
    installer['src_bin']=$SCRIPT_DIR'/bin'
}; installer.unit

installer.install() {
    mkdir -p "${installer['bin']}"

    cp -a "${installer['src_bin']}/." "${installer['bin']}"
    chmod +x "${installer['bin']}/xfind"
    chmod +x "${installer['bin']}/utility.sh"

    sleep 1

    if grep -q "\$HOME/bin:\$PATH" ~/.bashrc; then
        echo "Path already exists in .bashrc"
    else
        echo "export PATH=\$HOME/bin:\$PATH" >> ~/.bashrc
    fi

    # shellcheck disable=SC1091
    source "$HOME/.bashrc"
}; installer.install