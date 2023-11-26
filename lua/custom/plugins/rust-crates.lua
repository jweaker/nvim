return {
  'saecki/crates.nvim',
  tag = 'v0.4.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup {
      null_ls = {
        enabled = true,
        name = 'crates.nvim',
      },
    }
  end,
}
