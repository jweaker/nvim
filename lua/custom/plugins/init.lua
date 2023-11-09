return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'aznhe21/actions-preview.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  { 'onsails/lspkind.nvim', lazy = false },
  {
    'mbbill/undotree',
    event = 'BufRead',
  },
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup()
    end,
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ':TSUpdate',
  },
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',
}
