return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
    require('onedark').setup {
      transparent = true,
      style = 'warmer',
    }
    require('onedark').load()
  end,
}
