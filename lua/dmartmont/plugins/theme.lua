local Catppuccin = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 100,
  opts = {
    flavour = 'latte',
    integrations = { cmp = true, native_lsp = true },
    color_overrides = {
      latte = {
        -- Port of Flexoki theme to Neovim through catppuccino.nvim
        -- Background
        base = '#FFFCF0',
        -- Panes
        mantle = '#F2F0E5',
        crust = '#E6E4D9',
        -- Surfaces
        surface0 = '#DAD8CE',
        surface1 = '#CECDC3',
        surface2 = '#B7B5AC', -- Selection bg
        -- Overlays
        overlay0 = '#B7B5AC', -- Inactive border, comments
        overlay1 = '#B7B5AC', -- Sublet text
        overlay2 = '#6F6E69', -- Braces
        -- Text
        text = '#100F0F',
        subtext0 = '#6F6E69',
        subtext1 = '#878580',
        -- Colors
        lavender = '#8B7EC8', -- Purple
        blue = '#205EA6', -- Dark blue
        sapphire = '#3AA99F',
        sky = '#4385BE',
        teal = '#3AA99F',
        green = '#879A39',
        yellow = '#D0A215',
        peach = '#DA702C', -- Orange
        maroon = '#CE5D97', -- Magenta
        red = '#D14D41',
        mauve = '#5E409D', -- Dark purple
        pink = '#A02F6F',
        -- flamingo = "#dd7878",
      },
    },
    highlight_overrides = {
      latte = function(colors)
        return {
          -- fzf overrides
          FzfLuaTitle = { fg = colors.blue },
          FzfLuaHeaderBind = { fg = colors.yellow },
          FzfLuaBufNr = { fg = colors.yellow },
          FzfLuaTabMarker = { fg = colors.yellow },
          FzfLuaHeaderText = { fg = colors.red },
          FzfLuaBufFlagCur = { fg = colors.red },
          FzfLuaBufFlagAlt = { fg = colors.teal },
          FzfLuaBufLineNr = { fg = colors.green },
          FzfLuaBufName = { fg = colors.maroon },
        }
      end,
    },
  },
  lazy = false,
}

return Catppuccin
