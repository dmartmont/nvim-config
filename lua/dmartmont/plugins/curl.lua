local Rest = {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
  },
  {
    'rest-nvim/rest.nvim',
    dependencies = { { 'luarocks.nvim' } },
    ft = 'http',
    opts = {
      result_split_horizontal = true,
      stay_in_current_window_after_split = true,
    },
    keys = {
      { '<leader>rc', 'RestNvim',     desc = 'curl request' },
      { '<leader>rl', 'RestNvimLast', desc = 'curl last request' },
    },
    config = function(opts)
      require('rest-nvim').setup(opts)
    end,
  },
}

-- return { Rest }
return { }
