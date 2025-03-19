local FzfLua = {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    -- Find
    { '<leader>ff',  '<cmd>FzfLua files<cr>',          desc = 'find files' },
    { '<leader>fr',  '<cmd>FzfLua resume<cr>',         desc = 'find resume' },
    { '<leader>fb',  '<cmd>FzfLua buffers<cr>',        desc = 'find buffers' },
    { '<leader>fo',  '<cmd>FzfLua oldfiles<cr>',       desc = 'find old files' },

    -- Grep
    { '<leader>fg',  '<cmd>FzfLua grep<cr>',           desc = 'grep search' },
    { '<leader>fgr', '<cmd>FzfLua grep_last<cr>',      desc = 'grep resume' },
    { '<leader>fgw', '<cmd>FzfLua grep_cword<cr>',     desc = 'grep word' },
    { '<leader>fgv', '<cmd>FzfLua grep_visual<cr>',    desc = 'grep visual' },
    { '<leader>fgl', '<cmd>FzfLua live_grep<cr>',      desc = 'grep live search' },
    { '<leader>fgg', '<cmd>FzfLua live_grep_glob<cr>', desc = 'grep live glob' },
    {
      '<leader>fgf',
      function()
        require('fzf-lua').live_grep({
          cwd = './' .. vim.fn.expand('%:h'),
        })
      end,
      desc = 'grep live in folder',
    },

    -- Colorschemes
    { '<leader>us', '<cmd>FzfLua colorschemes<cr>',          desc = 'colorschemes' },

    -- History
    { '<leader>hc', '<cmd>FzfLua command_history<cr>',       desc = 'commands history' },
    { '<leader>hs', '<cmd>FzfLua search_history<cr>',        desc = 'search history' },
    -- Commands
    { '<leader>?d', '<cmd>FzfLua help_tags<cr>',             desc = 'help docs' },
    { '<leader>cs', '<cmd>FzfLua commands<cr>',              desc = 'commands' },

    -- Quickfix
    { '<leader>xq', '<cmd>FzfLua quickfix<cr>',              desc = 'quickfix' },
    { '<leader>xd', '<cmd>FzfLua diagnostics_document<cr>',  desc = 'document diagnostics' },
    { '<leader>xw', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'workspace diagnostics' },
  },
  opts = {
    'hide',
    winopts = {
      height = 0.4,
      width = 1,
      row = 1,
      col = 1,
      preview = {
        default = 'bat',
        layout = 'horizontal',
        horizontal = 'right:45%',
      },
      on_create = function()
        vim.keymap.set(
          't',
          '<C-r>',
          [['<C-\><C-N>"'.nr2char(getchar()).'pi']],
          { expr = true, buffer = true }
        )
      end,
    },
    files = {
      cwd_prompt = false,
      cwd_prompt_shorten_len = 2,
      cwd_prompt_shorten_val = 2,
      path_shorten = 3,
    },
    keymaps = {
      fzf = {
        ['ctrl-f'] = 'preview-page-down',
        ['ctrl-b'] = 'preview-page-up',
      },
    },
    oldfiles = {
      cwd_only = true,
      fn_transform = function(entry)
        require('fzf-lua').make_entry.file(entry, { path_shorten = 3 })
      end,
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
