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

# Dựng 1 distrobox container theo tên (ví dụ: just box fe)
box name:
    distrobox assemble create --file distrobox/distrobox.ini --name {{name}}
