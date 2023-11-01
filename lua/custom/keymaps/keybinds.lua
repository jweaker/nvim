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

vim.keymap.set('n', '<leader>pc', "<cmd>lua require('persistence').load()<cr>",
	{ desc = 'Restore last session for current dir' })
vim.keymap.set('n', '<leader>pl', "<cmd>lua require('persistence').load({ last = true })<cr>",
	{ desc = 'Restore last session' })
vim.keymap.set('n', '<leader>pg', "<cmd>lua require('persistence').stop()<cr>", { desc = 'Quit without saving session' })

vim.keymap.set('n', '<leader>ss', "<cmd>lua require('spectre').toggle()<CR>", { desc = 'Spectre' })
