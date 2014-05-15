#!/usr/bin/env bash

__teamocil_complete_session() {
    local IFS=$'\n'
    local cur="${1}"
    COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(teamocil --list)" -- "${cur}") )
}

__teamocil_complete_option() {
    local cur="${1}"
    local options="--edit --here --layout --list --show"
    COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "${options}" -- "${cur}") )
}

_teamocil() {
    local cur

    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [[ ${cur} == -* ]]; then
        __teamocil_complete_option "${cur}"
    fi

    __teamocil_complete_session "${cur}"

    return 0
} &&
complete -F _teamocil teamocil

# vim: ts=4 sw=4 et filetype=sh
