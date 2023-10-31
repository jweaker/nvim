return {
  "simrat39/rust-tools.nvim",
  ft = { "rust", "rs" }, -- IMPORTANT: re-enabling this seems to break inlay-hints
  config = function()
    require("rust-tools").setup({
      tools = {
        executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = true,
          only_current_line = false,
          show_parameter_hints = true,
          parameter_hints_prefix = "<-",
          other_hints_prefix = "=>",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = "Comment",
        },
        hover_actions = {
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          auto_focus = true,
        },
      },
      server = {
        on_init = require("lvim.lsp").common_on_init,
        on_attach = function(_, bufnr)
          local rt = require("rust-tools")
          -- Hover actions
          vim.keymap.set("n", "<leader>lK", rt.hover_actions.hover_actions, { desc = "rust info", buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group,
            { dec = "rust actions", buffer = bufnr })
        end,
      },
    })
  end,
}
