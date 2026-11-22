# Dotfiles (Fedora Sway Atomic)

Cấu hình cá nhân cho **Fedora Sway Atomic**, quản lý theo hướng tối giản:
- **OS bất biến (Atomic):** Giữ nguyên nền hệ thống, chỉ ghi đè/bổ sung qua `config.d`.
- **Homebrew (`brew/.Brewfile`):** Toàn bộ công cụ CLI & dev.
- **Flatpak:** Ứng dụng GUI (Bitwarden, OBS Studio...).
- **GNU Stow + `just`:** Quản lý symlink từng package theo nhu cầu.

## Cấu trúc các package

| Package | Mô tả |
| :--- | :--- |
| `sway` | Module cấu hình trong `config.d/` (xem [`sway/.config/sway/README.md`](./sway/.config/sway/README.md)) |
| `waybar` | Thanh trạng thái tối giản (xem [`waybar/.config/waybar/README.md`](./waybar/.config/waybar/README.md)) |
| `foot` | Terminal mặc định (Fish shell, cỡ chữ) |
| `fish` / `starship` | Shell & prompt |
| `nvim` | Neovim config tối giản (xem [`nvim/.config/nvim/README.md`](./nvim/.config/nvim/README.md)) |
| `zed` | Zed editor config (xem [`zed/.config/zed/README.md`](./zed/.config/zed/README.md)) |
| `bat` / `git` / `lazygit` | Cấu hình `bat`, Git (`delta`) và Lazygit |
| `brew` | Danh sách gói CLI trong `~/.Brewfile` |
| `distrobox` | Manifest dựng container dev theo vai trò (xem [`distrobox/README.md`](./distrobox/README.md)) |
| `environment.d` | Biến môi trường phiên người dùng (Bitwarden SSH agent) |

## Cài đặt trên máy mới (Bootstrap)

1. Clone repo vào `~/dotfiles`:
   ```bash
   git clone <repo-url> ~/dotfiles
   cd ~/dotfiles
   ```
2. Link `~/.Brewfile` và cài toàn bộ CLI tools (sau khi đã có Homebrew):
   ```bash
   stow brew
   brew bundle -g
   ```
3. Link từng package bạn cần bằng `stow`:
   ```bash
   stow sway waybar foot fish starship nvim zed bat git lazygit environment.d
   ```
4. Reload Sway (`$mod+Shift+c` hoặc `just reload`).

## Các lệnh `just`

```bash
just              # Xem danh sách lệnh
just brew         # Đồng bộ gói từ ~/.Brewfile (brew bundle -g)
just box <name>   # Dựng 1 distrobox container (ví dụ: just box fe)
just reload       # Kiểm tra cú pháp Sway và reload Sway + Waybar
```
