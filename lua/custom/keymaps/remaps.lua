-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('i', '<C-BS>', function()
	local key = vim.api.nvim_replace_termcodes('<C-W>', true, false, true)
	vim.api.nvim_feedkeys(key, 'i', false)
end)
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

vim.keymap.set('i', '<C-BS>', '<C-W>')
vim.keymap.set('t', '<C-BS>', '<C-W>')
