# Complexity.nvim

![Complexity.nvim](./assets/banner.png)

A Neovim plugin to annotate cyclomatic complexity (CCN) of your Lua/PHP/JS/etc. functions inline, color-coded by level:

- **Low Complexity** (CCN ≤ 10) — green
- **Medium Complexity** (11 ≤ CCN ≤ 15) — yellow
- **High Complexity** (CCN > 15) — red

## Features

- Parse `lizard --csv` output (or any CSV) and display CCN as virtual text.
- Color-coded highlights: `LowComplexity`, `MediumComplexity`, `HighComplexity`.
- Optional auto-run on save or via `:ShowComplexity` user command.
- Fully configurable thresholds, filetypes, keymaps, and more.

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use ({
    "4DRIAN0RTIZ/complexity.nvim",
    run = "pip install lizard",
})
```

## Usage

### CMD

```vim
:ShowComplexity
```

### Configuration

```lua
require("complexity").setup({
    thresholds = {
        low = 10, -- CCN <= low is considered low complexity
        medium = 15, -- CCN > low and <= medium is medium complexity
        -- CCN > medium is high complexity
    },

    virt_prefix = "⮕ Complexity:", -- text prefix for virtual text
    virt_pos = "eol", -- extmark position ("eol" or "overlay")

    autosave = false, -- set true to annotate on BufWritePost
    autosave_patterns = { "*.php" }, -- file patterns to trigger autosave
})
```

| Option              | Default                     | Description                                            |
| ------------------- | --------------------------- | ------------------------------------------------------ |
| `thresholds`        | `{ low = 10, medium = 15 }` | CCN thresholds for complexity levels.                  |
| `virt_prefix`       | `"⮕ Complexity:"`           | Text prefix for virtual text.                          |
| `virt_pos`          | `"eol"`                     | Position of the virtual text (`"eol"` or `"overlay"`). |
| `autosave`          | `false`                     | Automatically annotate on save.                        |
| `autosave_patterns` | `{ "*.php" }`               | File patterns to trigger autosave.                     |

## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some feature'`)
5. Push to the branch (`git push origin feature/your-feature`)
6. Create a new Pull Request
7. Wait for review and feedback

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](./LICENSE.txt) file for details.
