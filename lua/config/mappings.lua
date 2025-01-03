vim.keymap.set("n", "<Esc>", "<Cmd>nohl<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>c", function()
	local current_buf = vim.api.nvim_get_current_buf()
	vim.cmd("BufferLineCyclePrev")

	if vim.bo.filetype == "NvimTree" then
		vim.cmd("wincmd p") -- Вернуться к предыдущему окну
	end

	vim.cmd("bd " .. current_buf)
end, { desc = "Close Window" })

vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Write Window" })

vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	'i',
	'<CR>',
	[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"]],
	{ noremap = true, silent = true, expr = true }
)

-- Tab для выбора следующего элемента
vim.api.nvim_set_keymap(
	'i',
	'<Tab>',
	[[coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]],
	{ noremap = true, silent = true, expr = true }
)

-- Shift+Tab для выбора предыдущего элемента
vim.api.nvim_set_keymap(
	'i',
	'<S-Tab>',
	[[coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]],
	{ noremap = true, silent = true, expr = true }
)
