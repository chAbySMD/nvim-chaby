vim.keymap.set('n', '<leader>c', "<Cmd>bd<CR>", {desc="Close current buffer"})
vim.keymap.set('n', '<leader>w', "<Cmd>w<CR>", {desc="Write current buffer"})

vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
