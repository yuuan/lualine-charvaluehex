# lualine-charvaluehex

A [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) component that
shows the hexadecimal value of the character under the cursor.

## Features

- Displays the hex bytes of the current character (e.g. `󰬈 0x41` for `A`).
- Handles multibyte characters (e.g. `󰬈 0xe38182` for `あ`).
- Shows a placeholder (`󰬈 ∅` by default) when the cursor is past the end of
  the line.
- Customisable icon, prefix, and empty-state symbol.

## Requirements

- Neovim
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- A [Nerd Font](https://www.nerdfonts.com/) to render the default `icon`
  (`󰬈`). Override `icon` if you are not using a Nerd Font.

## Installation

Add this plugin as a dependency of `lualine.nvim` so it is loaded before
`lualine`'s `setup()` resolves component names.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "yuuan/lualine-charvaluehex" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_z = { "charvaluehex" },
      },
    })
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "nvim-lualine/lualine.nvim",
  requires = { "yuuan/lualine-charvaluehex" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_z = { "charvaluehex" },
      },
    })
  end,
}
```

## Usage

Reference the component by its name (`"charvaluehex"`) in any lualine section:

```lua
sections = {
  lualine_z = { "charvaluehex" },
}
```

## Options

| Option        | Type   | Default | Description                                                  |
| ------------- | ------ | ------- | ------------------------------------------------------------ |
| `icon`        | string | `'󰬈'`   | Icon rendered before the hex value (standard lualine option). The default glyph requires a [Nerd Font](https://www.nerdfonts.com/). |
| `prefix`      | string | `'0x'`  | Prefix prepended to the hex digits.                          |
| `placeholder` | string | `'∅'`   | Text shown when no character is under the cursor (e.g. `'-'`, `'N/A'`). |

### Example with options

```lua
require("lualine").setup({
  sections = {
    lualine_z = {
      {
        "charvaluehex",
        icon = "",
        prefix = "\\x",
        placeholder = "N/A",
      },
    },
  },
})
```

## License

MIT. See [LICENSE](./LICENSE).
