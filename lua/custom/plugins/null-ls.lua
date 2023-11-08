return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    return {
      sources = {
        -- js
        diagnostics.eslint_d,
        diagnostics.jsonlint,
        code_actions.eslint_d,
        formatting.prettierd,

        -- lua
        formatting.stylua,
        diagnostics.luacheck,

        -- python (i dont use it)
        formatting.black,
        formatting.isort,
        diagnostics.pylint,

        -- shell
        diagnostics.shellcheck,

        -- c/cpp
        -- diagnostics.cppcheck,
        formatting.clang_format,

        -- go
        formatting.gofmt,
        diagnostics.gospel,

        -- general
        code_actions.gitsigns,
        completion.spell,
        code_actions.refactoring,
      },
    }
  end,
}
