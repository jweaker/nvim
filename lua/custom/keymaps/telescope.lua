local success, tel = pcall(require, 'telescope.builtin')

if success then
  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', tel.oldfiles, { desc = 'Find recently opened files' })
  vim.keymap.set('n', '<leader>b', tel.buffers, { desc = 'buffers' })
  vim.keymap.set('n', '<leader>f', tel.find_files, { desc = 'Find Files' })
  vim.keymap.set('n', '<leader>sf', tel.git_files, { desc = 'Git Files' })
  vim.keymap.set('n', '<leader>sq', tel.quickfix, { desc = 'Quickfix' })
  vim.keymap.set('n', '<leader>sb', tel.builtin, { desc = 'Telescope Builtins' })
  vim.keymap.set('n', '<leader>sh', tel.help_tags, { desc = 'Help' })
  vim.keymap.set('n', '<leader>sw', tel.grep_string, { desc = 'Current Word' })
  vim.keymap.set('n', '<leader>st', tel.live_grep, { desc = 'Find Text' })
  vim.keymap.set('n', '<leader>sr', tel.resume, { desc = 'Resume' })
else
  print 'Error: telescope not installed'
end
