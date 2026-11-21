# Sway Config Architecture

Thư mục này được quản lý bằng GNU Stow (`cd ~/dotfiles && stow sway`) và symlink tới `~/.config/sway`.

## 1. Cơ chế `layered-include` (Fedora Sway Atomic)

Không cần copy file `config` chính — Sway tự động đọc `/etc/sway/config` của hệ thống, và dòng cuối của file đó dùng `/usr/libexec/sway/layered-include` để gom các file `*.conf` từ 3 nguồn theo thứ tự ưu tiên tăng dần:

1. `/usr/share/sway/config.d/*.conf` (mặc định của distro)
2. `/etc/sway/config.d/*.conf` (cấu hình toàn hệ thống)
3. `~/.config/sway/config.d/*.conf` (cấu hình cá nhân — ưu tiên cao nhất)

**Quy tắc:**
- **Thứ tự nạp:** Theo thứ tự bảng chữ cái của tên file (`10-` → `20-` → ... → `95-`).
- **Ghi đè (override):** Đặt file cùng tên trong `config.d/` sẽ **thay thế hoàn toàn** file mặc định của hệ thống.
- **Tắt tính năng mặc định:** Tạo file rỗng cùng tên trong `config.d/` (ví dụ `90-bar.conf` hoặc `90-swayidle.conf`).
- **Thêm mới:** Đặt tên file không trùng với hệ thống.

## 2. Quy ước Prefix cho `config.d/`

| Prefix | Nhóm | Mục đích | Ví dụ |
| :--- | :--- | :--- | :--- |
| `10-` | Core / Systemd | Biến dùng chung, tích hợp session | `10-systemd-*.conf` *(hệ thống)* |
| `20-` | Input | Bàn phím, chuột, touchpad | `20-input.conf` |
| `30-` | Output | Màn hình, độ phân giải, tần số quét, scale, wallpaper | `30-output.conf` |
| `40-` | Theme | Font, gaps, border, màu sắc cửa sổ | `40-theme.conf` |
| `50-` | Window Rules | `for_window`, floating, gán app vào workspace | `50-rules-custom.conf` |
| `60-` | Keybindings | Phím tắt cá nhân, media, screenshot, brightness | `60-bindings-custom.conf` |
| `90-` | Bar & Idle | Status bar (Waybar/Swaybar), khóa màn hình, tắt màn hình | `90-bar.conf`, `90-swayidle.conf` |
| `95-` | Autostart | Ứng dụng/daemon tự khởi chạy khi mở Sway | `95-autostart-custom.conf` |

> **Các file hệ thống thường cần biết để override:**
> `50-rules-browser.conf`, `60-bindings-brightness.conf`, `60-bindings-media.conf`, `60-bindings-screenshot.conf`, `60-bindings-volume.conf`, `90-bar.conf`, `90-swayidle.conf`.

## 3. Lệnh kiểm tra & debug nhanh

```bash
# Kiểm tra cú pháp trước khi reload
sway -C

# Reload config (hoặc bấm $mod+Shift+c)
swaymsg reload

# Xem danh sách thực tế các file config.d đang được nạp
cat /run/user/$UID/sway/layered-include-*.conf

# Tra cứu thông số thiết bị / cửa sổ để viết config
swaymsg -t get_inputs
swaymsg -t get_outputs
swaymsg -t get_tree | grep -E 'app_id|class|name'

# Tra tài liệu chi tiết
man 5 sway
man 5 sway-input
man 5 sway-output
```
