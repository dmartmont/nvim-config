local ToggleTerm = {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<leader>ft', '<cmd>TermSelect<cr>', desc = 'terminal' },
  },
  opts = {
    open_mapping = [[<localleader>t]],
    direction = 'float',
    insert_mappings = false,
  },
}

return ToggleTerm
