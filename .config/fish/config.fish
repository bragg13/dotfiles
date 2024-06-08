set fish_greeting ""

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

alias dotconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
