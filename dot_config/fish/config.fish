if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose "Catppuccin Frappe"
end

alias cat bat

# Added by `rbenv init` on Mon Mar  9 12:49:18 CET 2026
status --is-interactive; and rbenv init - --no-rehash fish | source 
