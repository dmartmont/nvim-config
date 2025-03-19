local WhichKey = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o['timeout'] = true
    vim.o['timeoutlen'] = 300
    return nil
  end,
  opts = {
    preset = 'helix',
  },
  keys = {
    mode = { 'n', 'v' },
    { '<leader><tab>', group = 'tabs', desc = "Tabs"},
    { '<leader>b',     group = 'buffer' },
    { '<leader>c',     group = 'code' },
    { '<leader>cl',    group = 'lazy' },
    { '<leader>f',     group = 'find/file' },
    { '<leader>g',     group = 'git' },
    { '<leader>l',     group = 'lsp' },
    { '<leader>p',     group = 'pomodoro' },
    { '<leader>q',     group = 'quit/session' },
    { '<leader>s',     group = 'settings' },
    { '<leader>t',     group = 'terminal' },
    { '<leader>u',     group = 'ui' },
    { '<leader>w',     group = 'windows' },
    { '<leader>wl',    group = 'lsp workspace' },
    { '<leader>x',     group = 'diagnostics/quickfix' },
    { '[',             group = 'prev' },
    { ']',             group = 'next' },
    { 'g',             group = 'goto' },
  },
}

return WhichKey
