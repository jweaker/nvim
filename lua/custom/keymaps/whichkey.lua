-- document existing key chains
local wk = require 'which-key'
wk.add {
  { '<leader>a', name = 'Move', icon = { icon = '󰊕' } },
  { '<leader>d', name = 'Debug' },
  { '<leader>e', name = 'Explorer', icon = { icon = '󰙅' } },
  { '<leader>h', name = 'Harpoon', icon = { icon = '' } },
  { '<leader>l', name = 'Lsp', icon = { icon = '' } },
  { '<leader>p', name = 'Prev Sessions' },
  { '<leader>s', name = 'Search' },
  { '<leader>t', name = 'Terminal' },
  { '<leader>u', name = 'Undotree', icon = { icon = '󰕍' } },
  { '<leader>w', name = 'Workspace', icon = { icon = '' } },
}
