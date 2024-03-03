local NvimTreesitter = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', lazy = true },
  },
  -- See :help nvim-treesitter-modules
  opts = {
    ensure_installed = { 'fennel', 'lua', 'typescript', 'go' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    textobjects = {
      enable = true,
      select = {
        enabled = true,
        lookahead = true,
        keymaps = {
          ['ao'] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
          ['ai'] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
          ['ah'] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
          ['al'] = { query = '@assignment.rhs', desc = 'Select left hand side of an assignment' },
        },
      },
    },
    sync_install = false,
  },
  init = function(plugin)
    require('lazy.core.loader').add_to_rtp(plugin)
    require('nvim-treesitter.query_predicates')
    local something = ''
  end,
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}

return NvimTreesitter
