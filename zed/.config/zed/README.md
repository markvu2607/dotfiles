# Zed Config Architecture

Thư mục này được quản lý bằng GNU Stow (`cd ~/dotfiles && stow zed`) và symlink tới `~/.config/zed`.

## 1. Triết lý tách Global vs Project

- **Global ([`settings.json`](./settings.json)):** Chỉ giữ cấu hình chung của editor (shell `fish`, `vim_mode`, theme `Catppuccin Mocha`, layout dock, `git_panel`, tắt telemetry). **Không khai báo LSP/formatter theo ngôn ngữ ở mức global.**
- **Per-project (`.zed/settings.json` trong từng repo):** Khai báo đầy đủ `languages`, `lsp`, `formatter` và `terminal` (trỏ vào đúng Distrobox container của dự án đó).

### Extensions nên cài sẵn trong Zed (`Ctrl+Shift+X`)
- **Catppuccin** & **Catppuccin Icons**
- **Oxc** *(khi làm dự án FE)*
- **TypeScript Language Server** *(khi làm dự án TS 7+)*

---

## 2. Mẫu `.zed/settings.json` theo từng dự án

### Mẫu FE High Performance (TS 7+ / Oxc / Rust — Distrobox `fe`)
```jsonc
{
  "terminal": {
    "shell": {
      "with_arguments": {
        "program": "distrobox",
        "arguments": ["enter", "fe"]
      }
    }
  },
  "languages": {
    "TypeScript": {
      "language_servers": ["typescript-ls", "!vtsls", "!typescript-language-server", "..."],
      "formatter": { "language_server": { "name": "oxfmt" } }
    },
    "TSX": {
      "language_servers": ["typescript-ls", "!vtsls", "!typescript-language-server", "..."],
      "formatter": { "language_server": { "name": "oxfmt" } }
    },
    "JavaScript": { "formatter": { "language_server": { "name": "oxfmt" } } },
    "JSX": { "formatter": { "language_server": { "name": "oxfmt" } } },
    "JSON": { "formatter": { "language_server": { "name": "oxfmt" } } },
    "JSONC": { "formatter": { "language_server": { "name": "oxfmt" } } },
    "CSS": { "formatter": { "language_server": { "name": "oxfmt" } } }
  },
  "lsp": {
    "typescript-ls": {
      "binary": { "path": "distrobox", "arguments": ["enter", "fe", "--", "tsc", "--lsp"] }
    },
    "oxlint": {
      "binary": { "path": "distrobox", "arguments": ["enter", "fe", "--", "oxlint", "--lsp"] }
    },
    "oxfmt": {
      "binary": { "path": "distrobox", "arguments": ["enter", "fe", "--", "oxfmt", "--lsp"] }
    },
    "rust-analyzer": {
      "binary": { "path": "distrobox", "arguments": ["enter", "fe", "--", "rust-analyzer"] }
    }
  }
}
```

### Mẫu Python (`ty` + `ruff` — Distrobox `py`)
```jsonc
{
  "terminal": {
    "shell": {
      "with_arguments": {
        "program": "distrobox",
        "arguments": ["enter", "py"]
      }
    }
  },
  "languages": {
    "Python": {
      "language_servers": ["ty", "ruff", "!basedpyright", "!pyright", "..."],
      "formatter": { "language_server": { "name": "ruff" } }
    }
  },
  "lsp": {
    "ty": {
      "binary": { "path": "distrobox", "arguments": ["enter", "py", "--", "ty", "server"] }
    },
    "ruff": {
      "binary": { "path": "distrobox", "arguments": ["enter", "py", "--", "ruff", "server"] }
    }
  }
}
```

> **Mẹo khi làm việc nhóm:** nếu không muốn commit `.zed/settings.json` lên repo chung, thêm `.zed/` vào `.git/info/exclude` của dự án đó.
