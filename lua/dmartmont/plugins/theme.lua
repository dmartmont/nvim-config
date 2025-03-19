local Catppuccin = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 100,
  opts = {
    flavour = 'latte',
    integrations = { cmp = true, native_lsp = true },
    color_overrides = {
      -- Ports of Flexoki theme to Neovim through catppuccino.nvim
      latte = {
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
        blue = '#205EA6',     -- Dark blue
        sapphire = '#3AA99F',
        sky = '#4385BE',
        teal = '#3AA99F',
        green = '#879A39',
        yellow = '#D0A215',
        peach = '#DA702C',  -- Orange
        maroon = '#CE5D97', -- Magenta
        red = '#D14D41',
        mauve = '#5E409D',  -- Dark purple
        pink = '#A02F6F',   -- Dark magenta
        -- flamingo = "#dd7878",
      },
      frappe = {
        -- Background
        base = '#1C1B1A',
        -- Panes
        mantle = '#282726',
        crust = '#343331',
        -- Surfaces
        surface0 = '#343331',
        surface1 = '#403E3C',
        surface2 = '#575653', -- Selection bg
        -- Overlays
        overlay0 = '#575653', -- Inactive border, comments
        overlay1 = '#575653', -- Sublet text
        overlay2 = '#878580', -- Braces
        -- Text
        text = '#CECDC3',
        subtext0 = '#878580',
        subtext1 = '#6F6E69',
        -- Colors
        lavender = '#5E409D', -- Purple
        blue = '#4385BE',     -- Light blue
        sapphire = '#24837B',
        sky = '#205EA6',
        teal = '#24837B',
        green = '#66800B',
        yellow = '#AD8301',
        peach = '#BC5215',  -- Orange
        maroon = '#A02F6F', -- Magenta
        red = '#AF3029',
        mauve = '#8B7EC8',  -- Light purple
        pink = '#CE5D97',   -- Light magenta
        -- flamingo = "#dd7878",
      },
    },
    highlight_overrides = {
      latte = function(colors)
        return {
          -- General
          Folded = { bg = colors.surface0 },
          CursorLine = { bg = colors.crust },

          -- Fzf
          FzfLuaTitle = { fg = colors.blue },
          FzfLuaHeaderBind = { fg = colors.yellow },
          FzfLuaBufNr = { fg = colors.yellow },
          FzfLuaTabMarker = { fg = colors.yellow },
          FzfLuaHeaderText = { fg = colors.red },
          FzfLuaBufFlagCur = { fg = colors.red },
          FzfLuaBufFlagAlt = { fg = colors.teal },
          FzfLuaBufLineNr = { fg = colors.green },
          FzfLuaBufName = { fg = colors.maroon },

          -- Render markdown
          RenderMarkdownCode = { bg = colors.mantle },
          RenderMarkdownCodeInline = { fg = colors.yellow, bg = '' },
        }
      end,
    },
  },
  lazy = false,
}

-- local AutoDarkMode = {
--   'f-person/auto-dark-mode.nvim',
--   opts = {
--     set_dark_mode = function()
--       vim.api.nvim_set_option_value('background', 'dark', {})
--       vim.cmd('colorscheme catppuccin-frappe')
--     end,
--     set_light_mode = function()
--       vim.api.nvim_set_option_value('background', 'light', {})
--       vim.cmd('colorscheme catppuccin-latte')
--     end,
--   },
-- }

local RosePine =
{
  'rose-pine/neovim',
  name = 'rose-pine',
  opts = {
    variant = 'dawn',
    dark_variant = 'moon',
    enable = {
      legacy_variants = false
    },
    styles = {
        italic = false,
    },
    highlight_groups = {
          -- General
          Folded = { bg = 'surface' },
          CursorLine = { bg = 'highlight_low' },

          -- Fzf
          FzfLuaTitle = { fg = 'pine' },
          FzfLuaHeaderBind = { fg = 'gold' },
          FzfLuaBufNr = { fg = 'gold' },
          FzfLuaTabMarker = { fg = 'gold' },
          FzfLuaHeaderText = { fg = 'love' },
          FzfLuaBufFlagCur = { fg = 'love' },
          FzfLuaBufFlagAlt = { fg = 'foam' },
          FzfLuaBufLineNr = { fg = 'iris' },
          FzfLuaBufName = { fg = 'rose' },

          -- Render markdown
          RenderMarkdownCode = { bg = 'overlay' },
          RenderMarkdownCodeInline = { fg = 'gold', bg = '' },
    }
  }
}

return { Catppuccin, RosePine }
