#!/bin/bash
# shellcheck disable=SC2034

declare -A Color
declare -A Dictionary

Color.init() {
    Color["End"]='\033[0m'
    Color["Red"]='\033[0;31m'
    Color["Green"]='\033[0;32m'
    Color["Yellow"]='\033[0;33m'
    Color["Blue"]='\033[0;34m'
    Color["BRed"]='\033[1;31m'
    Color["BGreen"]='\033[1;32m'
    Color["BYellow"]='\033[1;33m'
    Color["BBlue"]='\033[1;34m'
}; Color.init

Dictionary.help() {
    printf '%s\n'   "Usage: $(basename "$0") [-r|--root] [-i|--input @type FILE] [TERM...] "\
                    ' § Options ▼'\
                    '        -r | --root                    Use root directory'\
                    '        -a | --auto                    Automatically choose the file type & search term'\
                    '        -i | --input @type FILE        Specify input directory'\
                    '        -v | --version                 Get xfind(s) version'\
                    '  ...any                               Search terminology'
}

Dictionary.version() {
    printf 'VERSION: 1.0.0\n'
}