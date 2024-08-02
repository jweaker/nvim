return {
  'simrat39/rust-tools.nvim',
  ft = { 'rust', 'rs' },
  config = function()
    local rt = require 'rust-tools'

    local extension_path = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    local this_os = vim.loop.os_uname().sysname

    -- The path in windows is different
    if this_os:find 'Windows' then
      codelldb_path = extension_path .. 'adapter\\codelldb.exe'
      liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
    else
      -- The liblldb extension is .so for linux and .dylib for macOS
      liblldb_path = liblldb_path .. (this_os == 'Linux' and '.so' or '.dylib')
    end

    local function rt_on_attach(idk, bufnr)
      require('which-key').add {
        { '<leader>r', name = 'Rust', icon = { icon = '' } },
      }
      -- Hover actions
      vim.keymap.set('n', '<leader>rk', rt.hover_actions.hover_actions, { desc = 'Info', buffer = bufnr })
      vim.keymap.set('n', '<leader>rd', rt.debuggables.debuggables, { desc = 'Debug', buffer = bufnr })
      vim.keymap.set('n', '<leader>rr', '<cmd>RustRun<cr>', { desc = 'Run', buffer = bufnr })
      vim.keymap.set('n', '<leader>rn', '<cmd>RustRunnables<cr>', { desc = 'Runnables', buffer = bufnr })
      vim.keymap.set('n', '<leader>rD', '<cmd>RustLastDebun<cr>', { desc = 'Last Debug', buffer = bufnr })
      vim.keymap.set('n', '<leader>rR', '<cmd>RustLastRun<cr>', { desc = 'Last Run', buffer = bufnr })
      vim.keymap.set('n', '<leader>rm', '<cmd>RustParentModule<cr>', { desc = 'Module Parent', buffer = bufnr })
      vim.keymap.set('n', '<leader>rc', '<cmd>RustOpenCargo<cr>', { desc = 'Cargo', buffer = bufnr })
      vim.keymap.set('n', '<leader>rp', '<cmd>RustPlay<cr>', { desc = 'Play', buffer = bufnr })
      vim.keymap.set('n', '<leader>ra', rt.code_action_group.code_action_group, { desc = 'Actions', buffer = bufnr })
      -- Code action groups
      Lsp_on_attach(idk, bufnr)
    end
    rt.setup {
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      tools = {
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          show_parameter_hints = false,
        },
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
      server = {
        standalone = true,
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = rt_on_attach,

        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ['rust-analyzer'] = {
            -- enable clippy on save
            checkOnSave = {
              command = 'clippy',
            },
          },
        },
      },
    }
  end,
}
