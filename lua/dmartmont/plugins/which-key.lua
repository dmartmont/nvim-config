local WhichKey = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o['timeout'] = true
    vim.o['timeoutlen'] = 300
    return nil
  end,
  opts = {
    key_labels = {
      ['<space>'] = 'SPC',
      ['<cr>'] = 'RET',
      ['<tab>'] = 'TAB',
    },
    defaults = {
      mode = { 'n', 'v' },
      ['g'] = { name = '+goto' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader><tab>'] = { name = '+tabs' },
      ['<leader>b'] = { name = '+buffer' },
      ['<leader>c'] = { name = '+code' },
      ['<leader>cl'] = { name = 'lazy' },
      ['<leader>f'] = { name = '+find/file' },
      ['<leader>g'] = { name = '+git' },
      ['<leader>l'] = { name = '+lsp' },
      ['<leader>wl'] = { name = '+lsp workspace' },
      ['<leader>p'] = { name = '+pomodoro' },
      ['<leader>q'] = { name = '+quit/session' },
      ['<leader>s'] = { name = '+settings' },
      ['<leader>t'] = { name = '+terminal' },
      ['<leader>u'] = { name = '+ui' },
      ['<leader>w'] = { name = '+windows' },
      ['<leader>x'] = { name = '+diagnostics/quickfix' },
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}

return WhichKey
