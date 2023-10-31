return {
  'simrat39/rust-tools.nvim',
  ft = { 'rust', 'rs' }, -- IMPORTANT: re-enabling this seems to break inlay-hints
  config = function()
    local rt = require 'rust-tools'

    rt.setup {
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set('n', '<leader>lK', rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set('n', '<leader>lA', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
    }
  end,
}
