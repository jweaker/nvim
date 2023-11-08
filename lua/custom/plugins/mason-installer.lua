return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  lazy = false,
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'prettierd',
        'eslint_d',
        'pylint',
        'jsonlint',
        'shellcheck',
        'stylua',
        'black',
        'luacheck',
        'gospel',
        -- 'cpptools',
        'clang-format',
        'isort',
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
      debounce_hours = 1, -- at least 5 hours between attempts to install/update
    }
  end,
}
