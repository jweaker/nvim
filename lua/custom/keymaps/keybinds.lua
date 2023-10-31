vim.keymap.set('n', '<leader>c', '<cmd>bw<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Neotree' })
vim.keymap.set('n', '<leader>u', function()
	vim.cmd.UndotreeToggle()
	vim.cmd.UndotreeFocus()
end, { desc = 'UndoTree' })

vim.keymap.set('n', '<leader>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Harpoon Marks' })
vim.keymap.set('n', '<leader>m', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Mark file with harpoon' })
vim.keymap.set('n', '<leader>lt', '<cmd>Trouble document_diagnostics<CR>', { desc = 'Trouble document' })
vim.keymap.set('n', '<leader>lT', '<cmd>Trouble workspace_diagnostics<CR>', { desc = 'Trouble workspace' })
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Horizontal' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Vertical' })
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Float' })
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=tab<CR>', { desc = 'Tab' })

vim.keymap.set('n', '<leader>pc', "<cmd>lua require('persistence').load()<cr>",
	{ desc = 'Restore last session for current dir' })
vim.keymap.set('n', '<leader>pl', "<cmd>lua require('persistence').load({ last = true })<cr>",
	{ desc = 'Restore last session' })
vim.keymap.set('n', '<leader>pg', "<cmd>lua require('persistence').stop()<cr>", { desc = 'Quit without saving session' })

vim.keymap.set('n', '<leader>ss', "<cmd>lua require('spectre').toggle()<CR>", { desc = 'Spectre' })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('n', '<M-l>', [[<Cmd>wincmd ><CR>]], opts)
	vim.keymap.set('n', '<M-h>', [[<Cmd>wincmd <<CR>]], opts)
	vim.keymap.set('n', '<M-k>', [[<Cmd>wincmd -<CR>]], opts)
	vim.keymap.set('n', '<M-j>', [[<Cmd>wincmd +<CR>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

vim.keymap.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]])

vim.keymap.set('n', '<M-l>', [[<Cmd>wincmd ><CR>]])
vim.keymap.set('n', '<M-h>', [[<Cmd>wincmd <<CR>]])
vim.keymap.set('n', '<M-k>', [[<Cmd>wincmd -<CR>]])
vim.keymap.set('n', '<M-j>', [[<Cmd>wincmd +<CR>]])
