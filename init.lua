-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ { import = 'custom.plugins' } }, {})
require('neodev').setup()

require 'custom.config.treesitter'
require 'custom.config.lsp'
require 'custom.config.cmp'

require 'custom.config.options'

require 'custom.keymaps.remaps'
require 'custom.keymaps.whichkey'
require 'custom.keymaps.telescope'
require 'custom.keymaps.keybinds'
