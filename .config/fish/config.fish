set fish_greeting ""

alias ll "eza -l -g --icons"
alias lla "ll -a" 
alias ld "ll -D"
alias ls eza    
alias llt "eza -T -L 2 -l -g --icons"

eval "$(/opt/homebrew/bin/brew shellenv)"

alias dotconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
