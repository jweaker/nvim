return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ['<Tab>'] = require('telescope.actions').move_selection_next,
            ['<S-Tab>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
          i = {
            ['<Tab>'] = require('telescope.actions').move_selection_previous,
            ['<S-Tab>'] = require('telescope.actions').move_selection_next,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-BS>'] = function()
              local key = vim.api.nvim_replace_termcodes("<C-W>", true, false, true)
              vim.api.nvim_feedkeys(key, "i", false)
            end,
            ['<M-BS>'] = function()
              local key = vim.api.nvim_replace_termcodes("<C-W>", true, false, true)
              vim.api.nvim_feedkeys(key, "i", false)
            end,
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end
}
