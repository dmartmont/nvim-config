local ToggleTerm = {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<leader>ft',         '<cmd>TermSelect<cr>', desc = 'terminal' },
    { '<localleader><esc>', '<C-\\><C-n>',         desc = 'quit terminal mode', mode = 't' },
  },
  opts = {
    open_mapping = [[<localleader>t]],
    direction = 'float',
    insert_mappings = false,
  },
}

return ToggleTerm
