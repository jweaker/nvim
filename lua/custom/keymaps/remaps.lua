-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-H>', '<C-W>', { noremap = true })

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>noh <CR>')

vim.keymap.set('n', 'H', '^')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('o', 'H', '^')

vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', '$')
vim.keymap.set('o', 'L', '$')

vim.keymap.set('n', '<M-d>', '"_d')
vim.keymap.set('v', '<M-d>', '"_d')
vim.keymap.set('o', '<M-d>', '"_d')

vim.keymap.set('n', '<M-c>', '"_c')
vim.keymap.set('v', '<M-c>', '"_c')
vim.keymap.set('o', '<M-c>', '"_c')

vim.keymap.set('n', '<M-x>', '"_x')
vim.keymap.set('v', '<M-x>', '"_x')
vim.keymap.set('o', '<M-x>', '"_x')

local term = require 'toggleterm'

local opts = { buffer = 0 }
local function first()
  term.toggle(1, nil, nil, 'tab')
end

local function second()
  term.toggle(2, nil, nil, 'tab')
end

local function third()
  term.toggle(3, nil, nil, 'tab')
end

local function forth()
  term.toggle(4, nil, nil, 'tab')
end

vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

vim.keymap.set('t', '<C-M-l>', [[<Cmd>wincmd ><CR>]])
vim.keymap.set('t', '<C-M-h>', [[<Cmd>wincmd <<CR>]])
vim.keymap.set('t', '<C-M-k>', [[<Cmd>wincmd -<CR>]])
vim.keymap.set('t', '<C-M-j>', [[<Cmd>wincmd +<CR>]])

vim.keymap.set('t', '<M-1>', first, { desc = 'Horizontal' })
vim.keymap.set('t', '<M-2>', second, { desc = 'Vertical' })
vim.keymap.set('t', '<M-3>', third, { desc = 'Float' })
vim.keymap.set('t', '<M-4>', forth, { desc = 'Tab' })

vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

----

vim.keymap.set('n', '<M-1>', first, { desc = 'Horizontal' })
vim.keymap.set('n', '<M-2>', second, { desc = 'Vertical' })
vim.keymap.set('n', '<M-3>', third, { desc = 'Float' })
vim.keymap.set('n', '<M-4>', forth, { desc = 'Tab' })

vim.keymap.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]])

vim.keymap.set('n', '<C-M-l>', [[<Cmd>wincmd ><CR>]])
vim.keymap.set('n', '<C-M-h>', [[<Cmd>wincmd <<CR>]])
vim.keymap.set('n', '<C-M-k>', [[<Cmd>wincmd -<CR>]])
vim.keymap.set('n', '<C-M-j>', [[<Cmd>wincmd +<CR>]])
