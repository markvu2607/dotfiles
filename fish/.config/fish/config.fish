fish_add_path -g ~/.local/bin ~/bin

if test -x /home/linuxbrew/.linuxbrew/bin/brew
	eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end
end
