local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify('Failed to load plugin "lspconfig"')
  return
end

-- NOTE Call this function before you set up any servers!
require('nvim-lsp-installer').setup {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls
require('lspconfig').vimls.setup{}
vim.g.markdown_fenced_languages = { 'vim', 'help' }

-- TODO https://github.com/bash-lsp/bash-language-server
-- require'lspconfig'.bashls.setup{}

-- require("user.lsp.lsp-installer")
-- require("user.lsp.handlers").setup()

-- TODO https://github.com/LunarVim/Neovim-from-scratch/tree/master/lua/user/lsp
-- require 'user.lsp.configs'
-- require('user.lsp.handlers').setup()
-- require 'user.lsp.null-ls'
