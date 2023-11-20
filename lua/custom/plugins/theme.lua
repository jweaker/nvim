return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('onedark').setup {
      transparent = true,
      style = 'warmer',
    }
    require('onedark').load()
    vim.cmd.colorscheme 'onedark'
  end,
}
-- return { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
