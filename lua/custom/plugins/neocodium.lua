return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup {

      show_label = false,
    }
    vim.keymap.set('i', '<C-f>', neocodeium.accept)
    vim.keymap.set('i', '<C-d>', neocodeium.clear)
    vim.keymap.set('i', '<C-l>', neocodeium.cycle_or_complete)
    vim.keymap.set('i', '<C-h>', function()
      neocodeium.cycle_or_complete(-1)
    end)
  end,
}
