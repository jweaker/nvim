-- document existing key chains
require('which-key').register {
  ['<leader>p'] = { name = 'Prev Sessions', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = 'Debug', _ = 'which_key_ignore' },
}
