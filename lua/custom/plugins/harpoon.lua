return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'letieu/harpoon-lualine',
  },
  config = function()
    local harpoon = require 'harpoon'

    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon Marks' })
    vim.keymap.set('n', '<leader>m', function()
      harpoon:list():add()
    end, { desc = 'Mark file with harpoon' })

    for i = 1, 9, 1 do
      local i_string = tostring(i)
      vim.keymap.set('n', '<leader>' .. i_string, function()
        harpoon:list():select(i)
      end, { desc = 'which_key_ignore' })
    end
  end,
}
