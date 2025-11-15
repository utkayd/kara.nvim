# Kara

**Kara** (meaning "Dark" or "Black" in Turkish) is a dark Neovim colorscheme that goes easy on your eyes, written in Lua.

## ✨ Features

- **Dark theme** optimized for long coding sessions
- **Comprehensive plugin support** including Snacks.nvim, Mini.nvim, TreeSitter, LSP, and more
- **Semantic highlighting** with modern TreeSitter support
- **Customizable** via `on_highlights` callback
- **Italic support** for comments, keywords, and booleans
- **Simple color palette** with just 3 gray shades for easy maintenance
- **Transparent background** option

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "utkayd/kara.nvim",
  priority = 1000,
  config = function()
    require("kara").setup()
    vim.cmd("colorscheme kara")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "utkayd/kara.nvim",
  config = function()
    require("kara").setup()
    vim.cmd("colorscheme kara")
  end
}
```

### Manual Installation

1. Clone this repository into your Neovim config directory:
   ```bash
   git clone https://github.com/utkayd/kara.nvim ~/.config/nvim/pack/plugins/start/kara.nvim
   ```

2. Add to your `init.lua`:
   ```lua
   require("kara").setup()
   vim.cmd("colorscheme kara")
   ```

## ⚙️ Configuration

Kara can be customized using the `setup()` function:

```lua
require("kara").setup({
  italic_comments = "italic",     -- Enable italic comments (or false)
  italic_keywords = "italic",     -- Enable italic keywords (or false)
  italic_booleans = "italic",     -- Enable italic booleans (or false)
  italic_functions = false,       -- Disable italic functions (or "italic")
  italic_variables = false,       -- Disable italic variables (or "italic")
  transparent_background = false, -- Disable transparent background (or true)

  -- Customize individual highlight groups
  on_highlights = function(highlights, colors)
    -- Example: Disable italic comments
    highlights.Comment.italic = false

    -- Example: Change function color
    highlights["@function"].fg = colors.blue

    -- Example: Make cursor line more subtle
    highlights.CursorLine.bg = colors.bg2
  end
})
```

## 🎨 Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| **Foreground** | `#DFE0EA` | Main text color |
| **Background** | `#2b2e36` | Editor background |
| **Red** | `#E85A84` | Built-in variables, errors |
| **Green** | `#A6DB95` | Strings, success messages |
| **Blue** | `#7EB7E6` | Functions, types |
| **Yellow** | `#EED49F` | Properties, warnings |
| **Orange** | `#E0828D` | Constants |
| **Orange2** | `#FAB387` | Numbers, built-in functions |
| **Pink** | `#D895C7` | Keywords, labels |
| **Purple** | `#6a4c93` | Cursor word highlights |
| **Gray1** | `#6B7A94` | Comments, borders, inactive elements |
| **Gray2** | `#8B9AAF` | Line numbers, delimiters, secondary text |
| **Gray3** | `#C6D0E0` | Active elements, identifiers |

### Semantic Color Usage

- **Keywords** (local, function, if, return): Pink
- **Functions**: Blue
- **Properties/Fields**: Yellow
- **Variables**: Gray3 (light)
- **Constants**: Orange
- **Strings**: Green
- **Numbers**: Orange2
- **Comments**: Gray1 (dark)

## 🔌 Plugin Support

Kara includes built-in support for popular Neovim plugins:

### Core Neovim
- TreeSitter (modern `@` syntax)
- LSP (Language Server Protocol)
- Diagnostics
- Diff
- Markdown

### UI Plugins
- **Snacks.nvim**: Dashboard, Picker, Input, Indent, Footer, StatusColumn, Win, Image
- **Mini.nvim**: All Mini plugins (icons, hipatterns, diff, statusline, tabline, starter, pick, files, clue, deps, notify, map, jump, indentscope, cursorword, surround, test, trailspace, completion, animate, operators)
- **Telescope**: Fuzzy finder
- **Trouble**: Diagnostics list
- **WhichKey**: Key binding helper
- **NvimTree**: File explorer
- **Dashboard**: Start screen

### Completion
- nvim-cmp
- Blink.cmp

### Git Integration
- Gitsigns
- GitGutter
- Diffview
- Neogit

### Other
- indent-blankline
- vim-illuminate
- Startify
- Flutter Tools

## 📁 Project Structure

```
kara/
├── colors/
│   └── kara.lua              # Colorscheme entry point
├── lua/
│   └── kara/
│       ├── init.lua          # Main module with setup and highlights
│       ├── test.lua          # Lush-based reference (auto-generated)
│       └── test_colors.lua   # Color palette reference
└── README.md
```

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

MIT License - see LICENSE file for details

## 💡 Acknowledgments

Built with inspiration from the Neovim colorscheme ecosystem, especially Catppuccin and other modern themes.

---

**Note**: This colorscheme is designed for Neovim with `termguicolors` enabled. Make sure you have `vim.o.termguicolors = true` in your configuration.
