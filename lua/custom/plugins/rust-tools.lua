return {
  'simrat39/rust-tools.nvim',
  ft = { 'rust', 'rs' }, -- IMPORTANT: re-enabling this seems to break inlay-hints
  config = function()
    local rt = require 'rust-tools'

    rt.setup {
      tools = {
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
      server = {

        standalone = true,
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set('n', '<leader>lK', rt.hover_actions.hover_actions, { rust = "Rust Info", buffer = bufnr })
          -- Code action groups
          vim.keymap.set('n', '<leader>lA', rt.code_action_group.code_action_group,
            { desc = "Rust Actions", buffer = bufnr })

          On_attach(_, bufnr)
        end,

        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
  end,
}
