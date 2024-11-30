return {
  "nvim-telescope/telescope.nvim",
  config = function ()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>fa', builtin.find_files, {desc="Find files"})
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, {desc="Find text"})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc="Find buffers"})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc="Find help"})
  end
}
