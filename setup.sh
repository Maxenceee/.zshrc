#!/bin/zsh

echo "Setting up zsh configuration..."

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.old
fi

cp ./config.zsh ~/.zshrc

source ~/.zshrc

echo "Configuration... done"

echo -n "Do you want to close this terminal and open a new one with the new configuration? (y/n) "
read reponse

if [[ "$reponse" == "y" || "$reponse" == "Y" ]]; then
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Ouvre un nouveau terminal pour Linux
        if command -v gnome-terminal &> /dev/null; then
            gnome-terminal
        elif command -v xterm &> /dev/null; then
            xterm
        elif command -v konsole &> /dev/null; then
            konsole
        else
            echo "Aucun terminal compatible trouvé."
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Ouvre un nouveau terminal pour macOS
        open -a Terminal
    else
        echo "Unknown os"
    fi

    # sleep 1

    kill -9 $PPID
fi
