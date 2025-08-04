-- [[ Configure LSP ]]
-- This function gets run when an LSP connects to a particular buffer.
function Lsp_on_attach(client, bufnr)
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
  nmap('<leader>lS', tel.lsp_dynamic_workspace_symbols, 'Symbols Workspace')
  nmap('<leader>ld', tel.diagnostics, 'Diagnostics')

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

-- Set up capabilities for LSP servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Configure individual LSP servers using the modern vim.lsp.config approach
-- Lua Language Server
vim.lsp.config('lua_ls', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      format = { enable = false },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- TypeScript Language Server
vim.lsp.config('ts_ls', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- Svelte Language Server
vim.lsp.config('svelte', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- Tailwind CSS Language Server
vim.lsp.config('tailwindcss', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- Python Language Server
vim.lsp.config('pyright', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- CSS Language Server
vim.lsp.config('cssls', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- Emmet Language Server
vim.lsp.config('emmet_ls', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- Go Language Server
vim.lsp.config('gopls', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- HTML Language Server
vim.lsp.config('html', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- Astro Language Server
vim.lsp.config('astro', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
})

-- JSON Language Server
vim.lsp.config('jsonls', {
  on_attach = Lsp_on_attach,
  capabilities = capabilities,
  settings = {
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
})

-- C/C++ Language Server (clangd needs special offset encoding)
vim.lsp.config('clangd', {
  on_attach = Lsp_on_attach,
  capabilities = vim.tbl_deep_extend('force', capabilities, {
    offsetEncoding = { 'utf-16' },
  }),
})

-- Enable all the configured LSP servers
local servers = {
  'lua_ls',
  'ts_ls',
  'svelte',
  'tailwindcss',
  'pyright',
  'cssls',
  'emmet_ls',
  'gopls',
  'html',
  'astro',
  'jsonls',
  'clangd',
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
