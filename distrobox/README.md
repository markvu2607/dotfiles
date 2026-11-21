# Distrobox Dev Containers

Quản lý môi trường lập trình theo **vai trò (role)** bằng `distrobox assemble` — toàn bộ SDK, compiler, LSP, formatter nằm gọn trong container, **không xả rác vào host Fedora Sway Atomic**.

Khi vào container (`distrobox enter <tên>`), bạn vào thẳng shell **`fish`**, chạy **chính `nvim` từ Homebrew + config `~/.config/nvim`** trên host, và Neovim tự động kích hoạt các LSP/formatter có sẵn trong container đó.

## Các container hiện có ([`distrobox.ini`](./distrobox.ini))

| Container | Vai trò | Công cụ & Shell |
| :--- | :--- | :--- |
| **`fe`** | Frontend High Performance | **`fish`** shell + **Vite+ (`vp`)** (tự cài sẵn qua `init_hooks`, quản lý JS runtime + Oxc `oxlint`/`oxfmt`) + **`rustup`** + bộ build C/C++/OpenSSL (`gcc`, `gcc-c++`, `make`, `pkg-config`, `openssl-devel`) |

*(Sau này có thể thêm các role khác như `[be-go]`, `[be-dotnet]`, `[py]` ngay trong `distrobox.ini`.)*

## Cách sử dụng

```bash
# 1. Dựng container 'fe' từ ~/dotfiles (tự cài fish, rustup, Vite+ vp)
just box fe

# 2. Vào container (tự mở bằng fish)
distrobox enter fe

# 3. Cài Rust toolchain lần đầu theo ý bạn (ví dụ stable + rust-analyzer + WASM)
rustup toolchain install stable --component rust-analyzer,clippy,rustfmt,rust-src
# rustup target add wasm32-unknown-unknown
```

### Các lệnh quản lý khác
```bash
distrobox list
distrobox assemble create --replace --file ~/dotfiles/distrobox/distrobox.ini --name fe
distrobox rm fe
```
