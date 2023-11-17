-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
Lsp_on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local tel = require 'telescope.builtin'

  nmap('<leader>lr', vim.lsp.buf.rename, 'Lsp Rename')
  nmap('<leader>la', require('actions-preview').code_actions, 'Lsp Actions')

  nmap('gd', tel.lsp_definitions, 'Goto Definition')
  nmap('gr', tel.lsp_references, 'Goto References')
  nmap('gI', tel.lsp_implementations, 'Goto Implementation')
  nmap('<leader>lD', tel.lsp_type_definitions, 'Definition')
  nmap('<leader>ls', tel.lsp_document_symbols, 'Symbols Document')
  nmap('<leader>lS', tel.lsp_dynamic_workspace_symbols, 'Symbols Sorkspace')
  nmap('<leader>ld', tel.lsp_dynamic_workspace_symbols, 'Diagnostics')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'List Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  rust_analyzer = {
    ['rust-analyzer'] = {
      -- enable clippy on save
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
  tsserver = {},
  svelte = {},
  tailwindcss = {},
  pyright = {},
  cssls = {},
  emmet_ls = {},
  eslint = {},
  gopls = {},
  html = {},
  astro = {},
  jsonls = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = '',
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
  clangd = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name == 'clangd' then
      local clangd_capabilities = capabilities
      clangd_capabilities.offsetEncoding = { 'utf-16' }
      require('lspconfig')[server_name].setup {
        capabilities = clangd_capabilities,
        on_attach = Lsp_on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    else
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = Lsp_on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end
  end,
}
