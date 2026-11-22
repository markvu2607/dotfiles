fish_add_path -g ~/.local/bin ~/bin

if test -x /home/linuxbrew/.linuxbrew/bin/brew
	eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

switch "$CONTAINER_ID"
    case fe
        fish_add_path -g ~/.cargo/bin
        if test -f ~/.config/vite-plus/env.fish
            source ~/.config/vite-plus/env.fish
        end
    case cp
        fish_add_path -g ~/.cargo/bin
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end
end
