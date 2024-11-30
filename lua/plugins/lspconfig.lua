return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp_servers = {
      'pyright',
      'ts_ls',
      'html',
      'cssls',
      'lua_ls'
    }

    for _, lsp in ipairs(lsp_servers) do
      local setup, lspconfig = pcall(require, 'lspconfig')
      if setup then
        lspconfig[lsp].setup{}
      else
        print("Ошибка при загрузке lspconfig: " .. lsp)
      end
    end
  end
}
