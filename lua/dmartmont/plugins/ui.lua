local NvimTree = {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = {},
  keys = {
    { '<leader>fe', '<cmd>NvimTreeToggle<cr>',   desc = 'toggle explorer' },
    { '<leader>fF', '<cmd>NvimTreeFindFile<cr>', desc = 'focus in explorer' },
  },
  lazy = false,
}

local function lsp_connection()
  -- Provides icon for LSP session
  local active_clients = vim.lsp.get_active_clients()
  if #active_clients == 0 then
    return ''
  elseif #active_clients == 1 then
    return ' ' .. active_clients[1].name
  else
    local first_active_client = ""
    for _, client in ipairs(active_clients) do
      if client.name ~= 'null-ls' then
        first_active_client = client.name
        break
      end
    end
    return ' ' .. first_active_client
  end
end

local function pomodoro()
  return require('pomodoro').get_current_state()
end

local function branch_color()
  local latte = require('catppuccin.palettes').get_palette('latte')
  return {
    fg = latte.mauve,
  }
end

local Lualine = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = {
    options = {
      theme = 'catppuccin',
      icons_enabled = true,
      section_separators = {
        left = '',
        right = '',
      },
      component_separators = {
        left = '|',
        right = '|',
      },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str)
            return string.sub(str, 1, 1)
          end,
        },
      },
      lualine_b = {
        { 'branch', icon = { '', color = branch_color }, color = branch_color },
      },
      lualine_c = {
        {
          'filename',
          filestatus = true,
          path = 4,
        },
      },
      lualine_x = {
        {
          'diff',
          symbols = {
            added = ' ',
            modified = ' ',
            removed = ' ',
          },
        },
      },
      lualine_y = {
        { 'diagnostics' },
        {
          lsp_connection,
        },
      },
      lualine_z = {
        { pomodoro },
        {
          'location',
          padding = {
            left = 0,
            right = 1,
          },
        },
        {
          'filetype',
          colored = false,
        },
      },
    },
    extensions = { 'lazy' },
  },
}

local Bufferline = {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

local Notifications = {
  'j-hui/fidget.nvim',
  opts = {
    notification = {
      override_vim_notify = true,
    },
  },
}

return { NvimTree, Lualine, Bufferline, Notifications }
