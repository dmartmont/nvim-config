vim.g.firenvim_config = {
  localSettings = {
    ['.*'] = {
      priority = 0,
      cmdline = 'neovim',
      content = 'text',
      takeover = 'never',
    },
  },
}
if vim.g.started_by_firenvim then
  vim.opt.guifont = 'JetBrainsMonoNL Nerd Font Mono:h14'
  vim.opt.wrap = true
end

local FireNvim = {
  'glacambre/firenvim',
  -- Lazy load firenvim
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn['firenvim#install'](0)
  end,
}

return FireNvim
