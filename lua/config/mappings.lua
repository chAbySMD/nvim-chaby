local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })

map("n", "<Esc>", "<Cmd>nohl<CR>", { desc = "Disable highlights after search", silent = true })

map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Write file" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
