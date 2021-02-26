#!/usr/bin/env bash

tmux_get_version () {
    # get tmux version
    tmux_version="$1"
    echo "tmux_version:" ${tmux_version}
    tmux_version_array=( ${tmux_version//./ } )
    major=${tmux_version_array[0]}
    echo "major:" ${major}
    minor=${tmux_version_array[1]}
    echo "minor:" ${minor}

    # version 2.1
    if [[ ( "${major}" -gt "2" ) || ( ( "${major}" -eq "2" ) && ( "${minor}" -ge "1" ) ) ]]
    then
        echo "ge_21"
    else
        echo "lt_21"
    fi

    # version 1.9
    if [[ ( "${major}" -gt "1" ) || ( ( "${major}" -eq "1" ) && ( "${minor}" -ge "9" ) ) ]]
    then
        echo "ge_19"
    else
        echo "lt_19"
    fi

    # mac os
    if [[ "$(uname)" == "Darwin" ]]
    then
        echo "osx"
    fi
}

echo "# test cases:"
tmux_get_version "1.8"
tmux_get_version "1.9"
tmux_get_version "2.0"
tmux_get_version "2.1"

echo ""
echo "# current system:"
tmux_get_version "$(tmux -V | cut -c 6-)"
