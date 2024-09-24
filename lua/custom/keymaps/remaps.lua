-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- i think its good enough
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ctrl backspace
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-H>', '<C-W>', { noremap = true })

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

-- movememnt
vim.keymap.set({ 'n', 'o', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'o', 'v' }, 'L', '$')

-- delete
vim.keymap.set({ 'n', 'v', 'o' }, '<M-d>', '"_d')
vim.keymap.set({ 'n', 'v', 'o' }, '<M-c>', '"_c')
vim.keymap.set({ 'n', 'v', 'o' }, '<M-x>', '"_x')

-- window
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>')
vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>')

vim.keymap.set('n', '<C-M-l>', [[<Cmd>wincmd ><CR>]])
vim.keymap.set('n', '<C-M-h>', [[<Cmd>wincmd <<CR>]])
vim.keymap.set('n', '<C-M-k>', [[<Cmd>wincmd -<CR>]])
vim.keymap.set('n', '<C-M-j>', [[<Cmd>wincmd +<CR>]])
