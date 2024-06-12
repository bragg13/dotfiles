set fish_greeting ""

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
    alias ld "ll -D"
    alias ls eza
    alias llt "eza -T -L 2 -l -g --icons"
end

alias dotconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
