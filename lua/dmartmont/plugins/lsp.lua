local Mason = {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  keys = { { '<leader>sm', '<cmd>Mason<cr>', desc = 'Mason' } },
  build = ':MasonUpdate',
  opts = {
    ensure_installed = {
      'lua-language-server',
      'typescript-language-server',
      'eslint-lsp',
      'html-lsp',
      'css-lsp',
      'stylua',
      'gopls',
    },
    ui = {
      border = 'rounded',
      width = 0.8,
      height = 0.8,
    },
  },
  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require('mason').setup(opts)
    local mr = require('mason-registry')
    mr:on('package:install:success', function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require('lazy.core.handler.event').trigger({
          event = 'FileType',
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('gd', vim.lsp.buf.definition, 'goto definition')
  nmap('gr', require('fzf-lua').lsp_references, 'goto references')
  nmap('gR', '<cmd>TroubleToggle lsp_references<cr>', 'goto references')
  nmap('gI', vim.lsp.buf.implementation, 'goto implementation')
  nmap('<leader>rn', vim.lsp.buf.rename, 'rename')
  nmap('<leader>ca', require('fzf-lua').lsp_code_actions, 'code action')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'type definition')
  nmap('<leader>ds', require('fzf-lua').lsp_document_symbols, 'document symbols')
  nmap('<leader>ws', require('fzf-lua').lsp_live_workspace_symbols, 'workspace symbols')
  nmap('<leader>cf', vim.lsp.buf.format, 'code format')
  nmap('<leader>vd', vim.diagnostic.open_float, 'diagnostics open')

  nmap('K', vim.lsp.buf.hover, 'hover documentation')
  -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap('gD', vim.lsp.buf.declaration, 'goto declaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'add folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'remove folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'list folders')
end

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
    on_attach = on_attach,
  })
end

local LspConfig = {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'folke/neodev.nvim', opts = {} },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        handlers = {
          default_setup,
          tsserver = function()
            require('lspconfig').tsserver.setup({
              capabilities = lsp_capabilities,
              init_options = {
                maxTsServerMemory = 1024 * 12,
                preferences = {
                  importModuleSpecifierPreference = 'non-relative',
                },
              },
              on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
                on_attach(client, bufnr)
              end,
            })
          end,
          eslint = function()
            require('lspconfig').eslint.setup({
              settings = {
                packageManager = 'yarn',
                filetypes = {
                  'javascript',
                  'javascript.jsx',
                  'javascriptreact',
                  'typescript',
                  'typescript.tsx',
                  'typescriptreact',
                },
              },
              on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false

                on_attach(client, bufnr)
              end,
            })
          end,
        },
      },
      config = function(_, opts)
        -- Setup mason-lspconfig only after mason, otherwise it will fail
        require('mason').setup()
        require('mason-lspconfig').setup(opts)
      end,
    },
  },
  init = function()
    local sign = function(opts)
      -- See :help sign_define()
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = '',
      })
    end

    sign({ name = 'DiagnosticSignError', text = '✘' })
    sign({ name = 'DiagnosticSignWarn', text = '▲' })
    sign({ name = 'DiagnosticSignHint', text = '' })
    sign({ name = 'DiagnosticSignInfo', text = '' })

    -- See :help vim.diagnostic.config()
    vim.diagnostic.config({
      virtual_text = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
      },
    })
  end,
}

local NoneLs = {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local none_ls = require('null-ls')
    local cmd_resolver = require('null-ls.helpers.command_resolver')

    none_ls.setup({
      sources = {
        -- Typescript
        -- Help none-ls to find the correct command
        -- none_ls.builtins.formatting.prettier.with({
        --   timeout = 8000,
        --   dynamic_command = function(params)
        --     return cmd_resolver.from_yarn_pnp()(params)
        --         or cmd_resolver.from_node_modules()(params)
        --         or vim.fn.executable(params.command) == 1 and params.command
        --   end,
        --   filetypes = {
        --     'javascript',
        --     'typescript',
        --     'javascriptreact',
        --     'typescriptreact',
        --     'vue',
        --     'css',
        --     'scss',
        --     'less',
        --     'html',
        --   },
        -- }),
        -- Lua
        none_ls.builtins.formatting.stylua,
        -- Bash
        -- none_ls.builtins.code_actions.shellcheck,
        -- none_ls.builtins.formatting.shfmt.with({
        -- 	extra_args = { "-i=2", "-ci" },
        -- }),
        -- Golang
        -- none_ls.builtins.diagnostics.golangci_lint,
        -- none_ls.builtins.formatting.gofmt,
      },
    })
  end,
}

return { Mason, LspConfig, NoneLs }
