local GitSigns = {
  'lewis6991/gitsigns.nvim',
  opts = {
    numhl = true,
  }
}

local Fugitive = {
  'tpope/vim-fugitive',
}

local GitDiff = {
  'sindrets/diffview.nvim',
}

return { GitSigns, Fugitive, GitDiff }
