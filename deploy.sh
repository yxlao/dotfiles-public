#!/usr/bin/env bash

# change to current directory
cd "${0%/*}"

# create symbolic link with backup
create_symbolic_link () {
    src_file=$1
    dst_file=$2

    # to create symbolink and backup if existed
    # backup non-symlinks
    if [ -e "$dst_file" -a ! -L "$dst_file" ]; then
        backup="$dst_file.`stat -c %y $dst_file | cut -c 1-10`"
        echo "Backing up $dst_file --> $backup"
        mv "$dst_file" "$backup"
    fi
    # link to the repository version
    echo "Creating $dst_file"
    ln -snfv "$src_file" "$dst_file"
}

# define deploy functions
deploy_dotfiles () {
    echo "Deploying dotfiles..."
    for name in *; do
        # ensure we don't copy items that aren't .files
        case "$name" in
            "vim"| \
            "bash_aliases"|"bashrc"|"bash_profile"|"xprofile"| \
            "tmux.conf"|"tmux.pane"| \
            "vimrc"|"gitconfig"|"gitignore"|"oh-my-zsh"|"zshrc"|"pdbrc")
                create_symbolic_link "$PWD/$name" "$HOME/.$name"
                ;;
        esac
    done
}

deploy_source () {
    echo "Sourcing files..."
    source bashrc
    source bash_aliases
}

deploy_submodules () {
    echo "Deploying submodules..."
    git submodule init
    git submodule update
}

update_submodules () {
    echo "Pulling latest submodules..."
    git submodule foreach git pull origin master
}

deploy_ubuntu_autostart () {
    echo "Autostart scripts..."
    autodir="$PWD/ubuntu/autostart"
    read -p "Setup autostart scripts in ~/.config/autostart [y/n]? " yn
    case $yn in
        [Yy]* )
            for source in $autodir/*; do
                # ensure we don't copy items that aren't .files
                name=$(basename "$source")
                target="$HOME/.config/autostart/$name"
                echo "$source"
                echo "$target"
                # backup non-symlinks
                if [ -e "$target" -a ! -L "$target" ]; then
                    backup="$target.`stat -c %y $target | cut -c 1-10`"
                    echo "Backing up $target --> $backup"
                    mv "$target" "$backup"
                fi
                # link to the repository version
                echo "Creating $target"
                ln -snfv "$source" "$target"
            done
            ;;
        [Nn]* ) ;;
        * ) echo "Please answer yes or no.";;
    esac
}

deploy_bluetooth_keyboard () {
    echo "Thinkpad Bluetooth compact keyboard..."
    read -p "Thinkpad Bluetooth compact keyboard in /etc/udev/ [y/n]? " yn
    case $yn in
        [Yy]* )
            ln -snfv "$PWD/src/bluetooth-runner/bluetooth-runner.py" \
                "$PWD/bin/bluetooth-runner"
            chmod +x "$PWD/bin/bluetooth-runner"
            exec "$PWD/src/tp-compact-keyboard/deploy.sh"
            ;;
        [Nn]* ) ;;
        * ) echo "Please answer yes or no.";;
    esac
}

deploy_nvm () {
    echo "Deploying NVM"
    curl https://raw.github.com/creationix/nvm/master/install.sh | sh
    wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
}

clean_ups () {
    echo "Cleaning up ~/.zcompdump*..."
    rm -rf $HOME/.zcompdump* > /dev/null 1>&2
    case $SHELL in
    */zsh)
        exec zsh
        ;;
    *)
    esac
}

# run deployes
deploy_submodules
deploy_dotfiles
# deploy_nvm
clean_ups
deploy_source
while getopts ':a:u' flag; do
    case "${flag}" in
        a)
            deploy_ubuntu_autostart
            deploy_bluetooth_keyboard
            ;;
        u)
            update_submodules
            ;;
    esac
done
