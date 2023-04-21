if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set default keybindings
# fish_default_key_bindings
fish_vi_key_bindings

# Aliasses Setter
alias setalias='read alias && echo "alias $alias" >> $HOME/.config/fish/config.fish'

# Useful Aliasses
alias cl='clear'
alias nf='neofetch'

# Git Aliasses
alias gb='git branch'
alias gco='git checkout'
alias gs='clear && git status'
alias gd='git diff'
alias ga='git add'
alias gaa='git add -A'
alias gl='git log'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'

alias gmd='git checkout main && git merge dev && git push && git checkout dev'
alias gmdd='git push && git checkout main && git merge dev && git push && git checkout dev'

# System Aliasses
alias bat='python $HOME/workspace/testlab/linux-tools/get_power_consumption.py'
alias stop-postgres='sudo systemctl stop postgresql && systemctl status postgresql | grep Active:'
alias start-postgres='sudo systemctl start postgresql && systemctl status postgresql | grep Active:'

