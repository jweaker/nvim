return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    return {
      sources = {
        -- js
        formatting.prettier,

        -- lua
        formatting.stylua,

        -- python (i dont use it)
        formatting.black,
        formatting.isort,

        -- shell
        diagnostics.zsh,

        -- c/cpp
        diagnostics.cppcheck,
        formatting.clang_format,

        -- go
        formatting.gofmt,

        -- general
        code_actions.gitsigns,
        code_actions.refactoring,
      },
    }
  end,
}
