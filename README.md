# My Neovim Configuration

This configuration is a work in progress.
## Features

- 🎨 Beautiful UI with Catppuccin theme
- 📦 Efficient plugin management with lazy.nvim
- 🔍 Powerful fuzzy finding with Telescope
- 🌳 Syntax highlighting and parsing with Treesitter
- 🔧 Built-in LSP configuration for multiple languages:
  - Python (pyright, ruff)
  - Go (gopls, golangci-lint)
  - C/C++ (clangd)
  - LaTeX (texlab)
  - Lua
- ✨ Code formatting and linting with null-ls
- 📝 Auto-completion with nvim-cmp
- 🔄 Git integration with gitsigns
- 💼 Session management
- 📑 Buffer management with barbar

## Getting Started

### Prerequisites

- Neovim >= 0.9.0
- Git
- Python 3.6+

### Installation

1. Back up your existing Neovim configuration if you have one:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this repository:
```bash
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
```

## Dependencies

To install all required dependencies:

1. Ensure Python 3.6+ is installed
2. Run the dependency installer:
   ```bash
   # On macOS/Linux (make the script executable):
   chmod +x scripts/install_dependencies.py
   ./scripts/install_dependencies.py

   # On Windows (PowerShell as Administrator):
   python scripts/install_dependencies.py
   ```
3. Restart your terminal
4. Open Neovim and run `:checkhealth` to verify the installation

## Key Bindings

Leader key is set to `Space`. Some notable keybindings include:

- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>e` - Toggle file tree