local Obsidian = {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = false,
  ft = 'markdown',
  dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp', 'ibhagwan/fzf-lua' },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      {
        name = 'work',
        path = '~/vaults/work',
      },
    },
    daily_notes = {
      folder = 'Dailies',
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    ui = {
      enable = false,
    },
    picker = {
      name = 'fzf-lua',
    },
  },
  keys = {
    { '<leader>of', ':ObsidianQuickSwitch<CR>' },
    { '<leader>os', ':ObsidianSearch<CR>' },
    { '<leader>ot', ':ObsidianToday<CR>' },
    { '<leader>oy', ':ObsidianYesterday<CR>' },
    { '<leader>on', ':ObsidianTomorrow<CR>' },
  },
}

local Markdown = {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    preset = 'obsidian',
    file_types = { 'markdown', 'txt' },
    render_modes = { 'n', 'v', 'i', 'c' },
    heading = {
      sign = false,
      width = 'block',
    },
    callout = {
      answer = {
        raw = '[!answer]',
        rendered = '󰄬 Answer',
        highlight = 'RenderMarkdownSuccess',
      },
      summary = {
        raw = '[!summary]',
        rendered = '󰄬 Summary',
        highlight = 'RenderMarkdownSuccess',
      },
      cancelled = {
        raw = '[!cancelled]',
        rendered = '󰜺 Cancelled ',
        highlight = 'RenderMarkdownError',
      },
    },
    checkbox = {
      custom = {
        in_progress = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
        cancelled = { raw = '[c]', rendered = '󰜺 ', highlight = 'RenderMarkdownError' },
        moved = { raw = '[>]', rendered = ' ', highlight = 'RenderMarkdownTodo' },
        important = { raw = '[!]', rendered = ' ', highlight = 'RenderMarkdownTodo' },
      },
    },
    code = {
      sign = false,
    },
  },
}

return { Obsidian, Markdown }
