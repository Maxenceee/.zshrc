#!/bin/zsh

echo "Setting up zsh configuration..."

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.old
fi

cp ./config.zsh ~/.zshrc

# Vérification de l'installation de fzf
if ! command -v fzf &> /dev/null; then

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Installation sur Linux avec apt
        if command -v apt &> /dev/null; then
            sudo apt update && sudo apt install -y fzf
        else
            echo "apt not installed. Could not install fzf."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Installation sur macOS avec Homebrew
        if command -v brew &> /dev/null; then
            brew install fzf
        else
            echo "Homebrew not installed. Could not install fzf."
            exit 1
        fi
    else
        echo "Unknown os"
        exit 1
    fi
fi

source ~/.zshrc

echo "Configuration... done"

exec zsh

# echo -n "Do you want to close this terminal and open a new one with the new configuration? (y/n) "
# read reponse

# if [[ "$reponse" == "y" || "$reponse" == "Y" ]]; then
    
#     if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#         # Ouvre un nouveau terminal pour Linux
#         if command -v gnome-terminal &> /dev/null; then
#             gnome-terminal
#         elif command -v xterm &> /dev/null; then
#             xterm
#         elif command -v konsole &> /dev/null; then
#             konsole
#         else
#             echo "Aucun terminal compatible trouvé."
#         fi
#     elif [[ "$OSTYPE" == "darwin"* ]]; then
#         # Ouvre un nouveau terminal pour macOS
#         open -a Terminal
#     else
#         echo "Unknown os"
#     fi

#     kill -9 $PPID
# fi
