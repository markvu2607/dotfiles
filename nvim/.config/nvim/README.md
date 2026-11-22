# Neovim Config

## Triết lý cấu hình

- **Ưu tiên Native Neovim + `mini.nvim`**: Tận dụng tối đa tính năng tích hợp sẵn của Neovim (`vim.pack`, `vim.lsp`, `vim.treesitter`, built-in completion/diagnostics) kết hợp hệ sinh thái `mini.nvim`.
- **Chỉ giữ đúng nhóm plugin cốt lõi (theo chuẩn `MiniMax`)**:
  - `mini.nvim`: UI, colorscheme, picker, files, git, diff, pairs, surround, comment...
  - `nvim-treesitter` + `nvim-treesitter-textobjects`: biên dịch parser cho engine `vim.treesitter` native (dùng `tree-sitter-cli` trong `brew/.Brewfile` làm build tool).
  - `nvim-lspconfig`: preset cấu hình cho `vim.lsp` native.
  - `conform.nvim`: format khi lưu file.
- **Không cài plugin hoặc công cụ quản lý thừa bên ngoài**: Tránh Mason, tránh thêm theme/plugin ngoài khi Native Neovim hoặc `mini.nvim` đã xử lý được.
- **LSP & Formatter đi theo môi trường (`PATH`)**: Tự động kích hoạt LSP nào có sẵn trong `PATH` của host hoặc Distrobox container hiện tại (`fe`, `cp`, ...).
