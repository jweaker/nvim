return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  lazy = false,
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'pretterd',
        'eslint_d',
        'pylint',
        'jsonlint',
        'shellcheck',
        'stylua',
        'black',
        'tidy',
        'cppcheck',
        'clazy',
        'isort',
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
      debounce_hours = 5, -- at least 5 hours between attempts to install/update
    }
  end,
}