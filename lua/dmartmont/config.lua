-- Setup colorscheme
vim.cmd.colorscheme('catppuccin')

-- Refresh changed content
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = '*',
  command = 'checktime',
})

local options = {
  encoding = 'utf-8',
  spelllang = 'en_gb',
  -- "backspace" "2"
  errorbells = false,
  backup = false,
  swapfile = false,
  -- show line numbers
  number = true,
  relativenumber = true,
  -- show line and column number
  ruler = true,
  -- settings needed for compe autocompletion
  completeopt = 'menuone,noselect',
  -- turn on the wild menu, auto complete for commands in command line
  wildmenu = true,
  wildignore = '*/tmp/*,*.so,*.swp,*.zip',
  -- case insensitive search
  ignorecase = true,
  -- smart search case
  smartcase = true,
  -- show invisible characters
  -- list = true,
  -- listchars = table.concat({ "trail:•", "eol:¬" }, ","),
  -- tabs is space
  expandtab = true,
  -- tab/indent size
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  -- open new horizontal panes on down pane
  splitbelow = true,
  -- open new vertical panes on right pane
  splitright = true,
  -- enable highlighting search
  hlsearch = true,
  -- single column for signs(icons) and line numbers
  signcolumn = 'yes',
  -- Width of gutter (number + sign columns)
  numberwidth = 3, -- relative numbers should only need 2 columns,
  -- Don't wrap lines
  wrap = false,
  cursorline = true,
  -- Max text width
  textwidth = 100,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
