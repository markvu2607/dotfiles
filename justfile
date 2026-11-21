default:
    @just --list

# Cài toàn bộ CLI tools từ ~/.Brewfile
brew:
    brew bundle -g

# Kiểm tra cú pháp Sway rồi reload Sway & Waybar
reload:
    sway -C
    swaymsg reload
    pkill -SIGUSR2 waybar || true
