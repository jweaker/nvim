return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_view_use_temp_files = 1
  end,
}
