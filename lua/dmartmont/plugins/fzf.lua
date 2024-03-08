local FzfLua = {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    -- Find
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'find files' },
    { '<leader>fr', '<cmd>FzfLua resume<cr>', desc = 'find resume' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'find buffers' },
    { '<leader>fo', '<cmd>FzfLua oldfiles<cr>', desc = 'find old files' },

    -- Grep
    { '<leader>fss', '<cmd>FzfLua grep<cr>', desc = 'grep search' },
    { '<leader>fsr', '<cmd>FzfLua grep_last<cr>', desc = 'grep resume' },
    { '<leader>fsl', '<cmd>FzfLua live_grep_native<cr>', desc = 'grep live search' },
    { '<leader>fsg', '<cmd>FzfLua live_grep_glob<cr>', desc = 'grep live glob' },

    -- Colorschemes
    { '<leader>us', '<cmd>FzfLua colorschemes<cr>', desc = 'colorschemes' },

    -- Commands
    { '<leader>ch', '<cmd>FzfLua command_history<cr>', desc = 'commands history' },
    { '<leader>cd', '<cmd>FzfLua help_tags<cr>', desc = 'help docs' },

    -- Quickfix
    { '<leader>xq', '<cmd>FzfLua quickfix<cr>', desc = 'quickfix' },
    { '<leader>xd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'document diagnostics' },
    { '<leader>xw', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'workspace diagnostics' },
  },
  opts = {
    'telescope',
    winopts = {
      height = 0.4,
      width = 1,
      row = 1,
      col = 1,
      preview = {
        default = 'bat',
        layout = 'horizontal',
        scrollbar = false,
        horizontal = 'right:45%',
      },
    },
    files = {
      preview = 'bat',
    },
    keymaps = {
      fzf = {
        ['ctrl-f'] = 'preview-page-down',
        ['ctrl-b'] = 'preview-page-up',
      },
    },
    oldfiles = {
      cwd_only = true,
    },
  },
  config = function(_, opts)
    local fzf = require('fzf-lua')
    fzf.setup(opts)
    -- Register fzf-lua as the default vim.ui.select handler
    fzf.register_ui_select()
  end,
}

return FzfLua
