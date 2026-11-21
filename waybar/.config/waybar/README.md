# Waybar Config Architecture

Thư mục này được quản lý bằng GNU Stow (`cd ~/dotfiles && stow waybar`) và symlink tới `~/.config/waybar`.
Trên Fedora Sway Atomic, Waybar được khởi chạy mặc định qua `/usr/share/sway/config.d/90-bar.conf`.

## 1. Cấu trúc 2 file cốt lõi

| File | Vai trò |
| :--- | :--- |
| [`config.jsonc`](./config.jsonc) | Bố cục thanh bar (`position`, `height`, 3 vùng `modules-*`) và cấu hình nội dung/tương tác của từng module. |
| [`style.css`](./style.css) | Giao diện GTK CSS (font, màu sắc, padding, hiệu ứng `:hover` và trạng thái `.focused`, `.muted`, `.critical`...). |

## 2. Bố cục & Module đang dùng

| Vùng | Module | Chức năng / Tương tác |
| :--- | :--- | :--- |
| **Left** | `sway/workspaces` | Danh sách workspace (click để chuyển). |
| | `sway/mode` | Hiện trạng thái mode đặc biệt (như `resize`), bình thường tự ẩn. |
| | `sway/scratchpad` | Đếm số cửa sổ đang cất trong scratchpad, bình thường tự ẩn. |
| **Center** | `clock` | Hiện `DD/MM/yyyy HH:mm`. Hover xem lịch tháng (highlight ngày hôm nay), click đổi sang xem đầy đủ thứ + giây. |
| **Right** | `idle_inhibitor` | Click bật/tắt chế độ chặn tự khóa & tắt màn hình. |
| | `pulseaudio` | Âm lượng loa/mic. Cuộn chuột chỉnh volume, click mở `pavucontrol`. |
| | `network` | Hiện `LAN` hoặc tên Wi-Fi + `%` (ẩn IP trên bar, hover để xem IP/Gateway). Click mở `nm-connection-editor`. |
| | `cpu` | % sử dụng CPU. |
| | `memory` | % RAM (hover xem `used / total GB`). |
| | `temperature` | Nhiệt độ CPU (`thermal-zone: 2` — `x86_pkg_temp`), cảnh báo khi ≥ 80°C. |
| | `tray` | Khay icon ứng dụng chạy nền (Bitwarden, `nm-applet`, OBS...). |

## 3. Lệnh reload & debug nhanh

```bash
# Reload nóng Waybar (không cần reload cả Sway)
pkill -SIGUSR2 waybar

# Khởi động lại Waybar và xem log lỗi nếu sửa hỏng config/CSS
killall waybar && waybar

# Mở GTK Inspector để soi CSS trực tiếp
GTK_DEBUG=interactive waybar

# Kiểm tra lại các cảm biến nhiệt độ nếu cần đổi thermal-zone
for z in /sys/class/thermal/thermal_zone*; do echo "$z: $(cat $z/type) = $(cat $z/temp)"; done

# Tra tài liệu chi tiết
man 5 waybar
```
