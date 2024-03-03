local NvimTree = {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = {},
  keys = {
    { '<leader>fe', '<cmd>NvimTreeToggle<cr>', desc = 'toggle explorer' },
    { '<leader>fF', '<cmd>NvimTreeFindFile<cr>', desc = 'focus in explorer' },
  },
  lazy = false,
}

local function lsp_connection()
  -- Provides icon for LSP session
  local active_clients = vim.lsp.get_active_clients()
  if #active_clients == 0 then
    return ''
  else
    return ''
  end
end

local function pomodoro()
  return require('pomodoro').get_current_state()
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
        {
          'filename',
          filestatus = true,
          path = 4,
        },
      },
      lualine_c = { { 'branch' } },
      lualine_x = { { 'diff' } },
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
