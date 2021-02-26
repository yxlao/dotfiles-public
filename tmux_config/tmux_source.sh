#!/usr/bin/env bash

source_tmux_by_version () {
    # get tmux config dir
    tmux_config_dir=$HOME/.dotfiles/tmux_config

    # get tmux version
    tmux_version="$1"
    echo "tmux_version:" ${tmux_version}
    tmux_version_array=( ${tmux_version//./ } )
    major=${tmux_version_array[0]}
    echo "major:" ${major}
    minor=${tmux_version_array[1]}
    echo "minor:" ${minor}

    # source common configs
    tmux source-file "$tmux_config_dir/tmux_common.conf"

    # version 2.1
    if [[ ( "${major}" -gt "2" ) || ( ( "${major}" -eq "2" ) && ( "${minor}" -ge "1" ) ) ]]
    then
        tmux source-file "$tmux_config_dir/tmux_ge_21.conf"
    else
        tmux source-file "$tmux_config_dir/tmux_lt_21.conf"
    fi

    # version 1.9
    if [[ ( "${major}" -gt "1" ) || ( ( "${major}" -eq "1" ) && ( "${minor}" -ge "9" ) ) ]]
    then
        tmux source-file "$tmux_config_dir/tmux_ge_19.conf"
    else
        tmux source-file "$tmux_config_dir/tmux_lt_19.conf"
    fi

    # mac os
    if [[ "$(uname)" == "Darwin" ]]
    then
        echo "osx"
        tmux source-file "$tmux_config_dir/tmux_osx.conf"
    fi

    # cygwin
    if [[ "$(uname)" = *"CYGWIN"* ]]; then
        echo "cygwin"
        tmux source-file "$tmux_config_dir/tmux_cygwin.conf"
    fi
}

source_tmux_by_version "$(tmux -V | cut -c 6-)"
