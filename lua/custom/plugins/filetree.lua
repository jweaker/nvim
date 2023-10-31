-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',              -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })
    require('neo-tree').setup {
      hijack_netrw_behavior = 'open_current',
      position = 'current',
      filesystem = {
        components = {
          harpoon_index = function(config, node, state)
            local Marked = require 'harpoon.mark'
            local path = node:get_id()
            local succuss, index = pcall(Marked.get_index_of, path)
            if succuss and index and index > 0 then
              return {
                text = string.format(' ⥤ %d', index), -- <-- Add your favorite harpoon like arrow here
                highlight = config.highlight or 'NeoTreeDirectoryIcon',
              }
            else
              return {}
            end
          end,
        },
        renderers = {
          file = {
            { 'icon' },
            { 'name',         use_git_status_colors = true },
            { 'harpoon_index' }, --> This is what actually adds the component in where you want it
            { 'diagnostics' },
            { 'git_status',   highlight = 'NeoTreeDimText' },
          },
        },
      },
      event_handlers = {

        {
          event = 'file_opened',
          handler = function()
            require('neo-tree.command').execute { action = 'close' }
          end,
        },
      },
    }
  end,
}
