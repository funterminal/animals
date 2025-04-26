#!/bin/sh

if [ -n "$PREFIX" ] && [ -f "$PREFIX/bin/pkg" ]; then
    pkg install -y wget
else
    if command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y wget
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y wget
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y wget
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm wget
    elif command -v zypper >/dev/null 2>&1; then
        sudo zypper install -y wget
    elif command -v brew >/dev/null 2>&1; then
        brew install wget
    else
        echo "Unsupported package manager"
        exit 1
    fi
fi

wget https://raw.githubusercontent.com/funterminal/animals/refs/heads/main/src/animals.sh -O animals.sh
chmod +x animals.sh

SHELL_NAME=$(basename "$SHELL")
ALIAS_CMD='alias animals="./animals.sh"'

if [ "$SHELL_NAME" = "bash" ]; then
    echo "$ALIAS_CMD" >> ~/.bashrc
elif [ "$SHELL_NAME" = "zsh" ]; then
    echo "$ALIAS_CMD" >> ~/.zshrc
elif [ "$SHELL_NAME" = "csh" ]; then
    echo "$ALIAS_CMD" >> ~/.cshrc
elif [ "$SHELL_NAME" = "tcsh" ]; then
    echo "$ALIAS_CMD" >> ~/.tcshrc
elif [ "$SHELL_NAME" = "ksh" ]; then
    echo "$ALIAS_CMD" >> ~/.kornrc
elif [ "$SHELL_NAME" = "fish" ]; then
    echo "alias animals './animals.sh'" >> ~/.config/fish/config.fish
fi

echo "animals is installed at 12.3.4"
