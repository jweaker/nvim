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


function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

	vim.keymap.set('n', '<C-M-l>', [[<Cmd>wincmd ><CR>]])
	vim.keymap.set('n', '<C-M-h>', [[<Cmd>wincmd <<CR>]])
	vim.keymap.set('n', '<C-M-k>', [[<Cmd>wincmd -<CR>]])
	vim.keymap.set('n', '<C-M-j>', [[<Cmd>wincmd +<CR>]])

	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

vim.keymap.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]])

vim.keymap.set('n', '<C-M-l>', [[<Cmd>wincmd ><CR>]])
vim.keymap.set('n', '<C-M-h>', [[<Cmd>wincmd <<CR>]])
vim.keymap.set('n', '<C-M-k>', [[<Cmd>wincmd -<CR>]])
vim.keymap.set('n', '<C-M-j>', [[<Cmd>wincmd +<CR>]])
