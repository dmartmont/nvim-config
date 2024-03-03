local Surround = {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  opts = {},
}

local Unimpaired = {
  'tpope/vim-unimpaired',
  event = 'VeryLazy',
  config = function() end,
}

local AutoPairs = {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {},
}

return { Surround, Unimpaired, AutoPairs }
