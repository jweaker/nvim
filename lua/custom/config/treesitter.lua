-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    context_commentstring = {
      enable = true,
    },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<C-space>',
        node_decremental = '<C-S-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@call.outer',
          ['if'] = '@call.inner',
          ['am'] = '@function.outer',
          ['im'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = '@call.outer',
          [']m'] = '@function.outer',
          [']c'] = '@class.outer',
          [']i'] = '@conditional.outer',
          [']l'] = '@loop.outer',
        },
        goto_next_end = {
          [']F'] = '@call.outer',
          [']M'] = '@function.outer',
          [']C'] = '@class.outer',
          [']I'] = '@conditional.outer',
          [']L'] = '@loop.outer',
        },
        goto_previous_start = {
          ['[f'] = '@call.outer',
          ['[m'] = '@function.outer',
          ['[c'] = '@class.outer',
          ['[i'] = '@conditional.outer',
          ['[l'] = '@loop.outer',
        },
        goto_previous_end = {
          ['[F'] = '@call.outer',
          ['[M'] = '@function.outer',
          ['[C'] = '@class.outer',
          ['[I'] = '@conditional.outer',
          ['[L'] = '@loop.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>af'] = '@call.outer',
          ['<leader>am'] = '@function.outer',
          ['<leader>ac'] = '@class.outer',
          ['<leader>ai'] = '@conditional.outer',
          ['<leader>al'] = '@loop.outer',
        },
        swap_previous = {
          ['<leader>aF'] = '@call.outer',
          ['<leader>aM'] = '@function.outer',
          ['<leader>aC'] = '@class.outer',
          ['<leader>aI'] = '@conditional.outer',
          ['<leader>aL'] = '@loop.outer',
        },
      },
    },
  }

  require('ts_context_commentstring').setup()
  local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

  -- Repeat movement with ; and ,
  -- ensure ; goes forward and , goes backward regardless of the last direction
  vim.keymap.set({ 'n', 'x', 'o' }, ';l', ts_repeat_move.repeat_last_move_next, { desc = 'Repeat last move next' })
  vim.keymap.set({ 'n', 'x', 'o' }, ';h', ts_repeat_move.repeat_last_move_previous, { desc = 'Repeat last move prev' })

  -- vim way: ; goes to the direction you were moving.
  -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
  -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
  vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
  vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
  vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
end, 0)
