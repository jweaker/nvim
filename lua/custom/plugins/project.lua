return {
  'ahmedkhalf/project.nvim',
  event = 'BufEnter',
  config = function()
    require('project_nvim').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    require('telescope').load_extension 'projects'
    vim.keymap.set('n', '<leader>sp', '<cmd>Telescope projects<CR>', { desc = 'Projects' })
  end,
}
