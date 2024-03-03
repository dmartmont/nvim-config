local icons = {
  Array = ' ',
  Boolean = '󰨙 ',
  Class = ' ',
  Codeium = '󰘦 ',
  Color = ' ',
  Control = ' ',
  Collapsed = ' ',
  Constant = '󰏿 ',
  Constructor = ' ',
  Copilot = ' ',
  Enum = ' ',
  EnumMember = ' ',
  Event = ' ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = '󰊕 ',
  Interface = ' ',
  Key = ' ',
  Keyword = ' ',
  Method = '󰊕 ',
  Module = ' ',
  Namespace = '󰦮 ',
  Null = ' ',
  Number = '󰎠 ',
  Object = ' ',
  Operator = ' ',
  Package = ' ',
  Property = ' ',
  Reference = ' ',
  Snippet = ' ',
  String = ' ',
  Struct = '󰆼 ',
  TabNine = '󰏚 ',
  Text = ' ',
  TypeParameter = ' ',
  Unit = ' ',
  Value = ' ',
  Variable = '󰀫 ',
}

local NvimCmp = {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- Copilot
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
    },
  },
  version = false, -- Last release is way too old
  opts = function()
    local cmp = require('cmp')
    local defaults = require('cmp.config.default')()

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    return {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'buffer', group_index = 1 },
      }, {
        { name = 'path' },
      }),
      mapping = cmp.mapping.preset.insert({
        -- Select items
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Down>'] = cmp.mapping.select_next_item(cmp_select),

        ['<C-y>'] = cmp.mapping.confirm({ select = true }),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      window = {
        completion = cmp.config.window.bordered({ border = 'rounded' }),
        documentation = cmp.config.window.bordered({ border = 'rounded' }),
      },
      formatting = {
        -- fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      sorting = defaults.sorting,
    }
  end,
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require('cmp').setup(opts)
  end,
}

local LuaSnip = {
  'L3MON4D3/LuaSnip',
  dependencies = {
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    {
      'nvim-cmp',
      dependencies = {
        'saadparwaiz1/cmp_luasnip',
      },
      opts = function(_, opts)
        opts.snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        }
        table.insert(opts.sources, { name = 'luasnip' })
      end,
    },
  },
  keys = {
    {
      '<tab>',
      function()
        local ls = require('luasnip')
        return ls.jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
      end,
      expr = true,
      silent = true,
      mode = 'i',
    },
    {
      '<tab>',
      function()
        require('luasnip').jump(1)
      end,
      mode = 's',
    },
    {
      '<s-tab>',
      function()
        require('luasnip').jump(-1)
      end,
      mode = { 'i', 's' },
    },
    {
      '<C-E>',
      function()
        local ls = require('luasnip')
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      { silent = true, mode = { 'i', 's' } },
    },
  },
}

return { NvimCmp, LuaSnip }
