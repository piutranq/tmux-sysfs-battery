#!/usr/bin/env bash
# ==================================================================
#   tmux-sysfs-battery/load.tmux
#   Replace "#{tmux-sysfs-battery}" token to battery indicator,
#   when the "$HOME/.tmux.conf" or "tpm" has (re)loaded.
# ==================================================================

declare repo="$(realpath -s $(dirname "${BASH_SOURCE[0]}" ))"
declare tmux_ver_digit="$(tmux -V | tr -dC '[:digit:]')"

function replace-option() {
    local opt_orig=$(tmux show-option -gqv ${1})
    local from="\#{tmux-sysfs-battery}"
    local to="#($repo/indicator)"

    local opt_new=${opt_orig//${from}/${to}}
    tmux set-option -gq "${1}" "${opt_new}"
}

function replace-all() {
    replace-option "status-left"
    replace-option "status-right"

    [[ $tmux_ver_digit -ge "29" ]] && {
        replace-option "status-format[0]"
        replace-option "status-format[1]"
        replace-option "status-format[2]"
        replace-option "status-format[3]"
        replace-option "status-format[4]"
    }
}

replace-all
