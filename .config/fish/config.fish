set fish_greeting ""

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
    alias ld "ll -D"
    alias ls eza
    alias llt "eza -T -L 2 -l -g --icons"

end
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 3.12
# The original version is saved in /Users/andrea/.config/fish/conf$
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bi$

alias dotconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
