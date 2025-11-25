# VSCode Neovim Configuration

This repository contains my personal configuration for using Neovim inside VSCode. It includes plugin management, key mappings, and custom settings to enhance the development experience.

## Features

- Easy plugin management with lazy.nvim
- Useful plugins: vim-surround, vscode-neovim-multicursor, hop, etc.
- Custom key mappings for productivity
- Compatible with VSCode Neovim extension

## Getting Started

1. Clone this repository:
   ```sh
   git clone https://github.com/MTsocute/nvim.git ~/.config/nvim
   ```
2. Open VSCode and ensure the Neovim extension is installed.
3. Enjoy your enhanced Neovim experience in VSCode!

## Keybindings

### Editor Navigation

| Key       | Mode           | Description              |
| --------- | -------------- | ------------------------ |
| `J`     | Normal, Visual | Previous Editor          |
| `K`     | Normal, Visual | Next Editor              |
| `<C-h>` | Normal         | Focus Left Editor Group  |
| `<C-l>` | Normal         | Focus Right Editor Group |
| `<C-j>` | Normal         | Focus Below Editor Group |
| `<C-k>` | Normal         | Focus Above Editor Group |

### File Operations

| Key            | Mode   | Description     |
| -------------- | ------ | --------------- |
| `<leader>ff` | Normal | Format Document |

### Editor Management

| Key            | Mode   | Description          |
| -------------- | ------ | -------------------- |
| `<leader>cc` | Normal | Close Current Editor |
| `<leader>ca` | Normal | Close All Editors    |

### Search & Navigation (Telescope-like)

| Key            | Mode   | Description               |
| -------------- | ------ | ------------------------- |
| `<leader>fa` | Normal | Find Files (Quick Open)   |
| `<leader>fg` | Normal | Live Grep (Global Search) |
| `<leader>fw` | Normal | Find Word (Current File)  |

### Code Folding

| Key    | Mode   | Description        |
| ------ | ------ | ------------------ |
| `zM` | Normal | Fold All           |
| `zR` | Normal | Unfold All         |
| `zc` | Normal | Fold               |
| `zC` | Normal | Fold Recursively   |
| `zo` | Normal | Unfold             |
| `zO` | Normal | Unfold Recursively |
| `za` | Normal | Toggle Fold        |

### Other

| Key       | Mode   | Description            |
| --------- | ------ | ---------------------- |
| `<Esc>` | Normal | Clear Search Highlight |

### Plugin: Hop.nvim (Quick Jump)

| Key                   | Mode   | Description                        |
| --------------------- | ------ | ---------------------------------- |
| `<leader><leader>w` | All    | Jump to word                       |
| `<leader><leader>l` | All    | Jump to line                       |
| `<leader><leader>co` | All    | Jump to single character           |
| `<leader><leader>cd` | All    | Jump to two characters             |
| `<leader><leader>f` | Normal | Jump using regex pattern (prompts) |

### Plugin: VSCode Multi Cursor

| Key            | Mode           | Description                                    |
| -------------- | -------------- | ---------------------------------------------- |
| `mc`         | Normal, Visual | Create cursor                                  |
| `mcc`        | Normal         | Cancel/Clear all cursors                       |
| `mi`         | Normal, Visual | Start cursors on the left                      |
| `mI`         | Normal, Visual | Start cursors on the left edge                 |
| `ma`         | Normal, Visual | Start cursors on the right                     |
| `mA`         | Normal, Visual | Start cursors on the right edge                |
| `[mc`        | Normal         | Go to previous cursor                          |
| `]mc`        | Normal         | Go to next cursor                              |
| `mcs`        | Normal         | Create cursor using flash                      |
| `mcw`        | Normal         | Create selection using flash                   |
| `<leader>p` | Normal         | Select current word, jump to previous match    |
| `<leader>n` | Normal         | Select current word, jump to next match        |
| `<leader>x` | Normal         | Cancel multi-cursor selection at current word |

### Plugin: vim-surround

Vim-surround provides commands to easily add, change, or delete surrounding characters (quotes, brackets, etc.).

Common commands:
- `ys{motion}{char}` - Add surrounding
- `cs{old}{new}` - Change surrounding
- `ds{char}` - Delete surrounding
- `S{char}` (in visual mode) - Surround selection

Examples:
- `ysiw"` - Surround word with "
- `cs"'` - Change " to '
- `ds"` - Delete surrounding "

> **Note**: `<leader>` is mapped to `Space`

## Documentation

- [中文版说明](./README.zh.md)
