local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify('Failed to load plugin "lspconfig"')
  return
end

local keymaps = require('user/keymaps')

-- NOTE You MUST pass `on_attach` and `capabilities` for each `setup {}`!

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  on_attach = keymaps.on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
}

require('lspconfig').html.setup {
  on_attach = keymaps.on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
}

require'lspconfig'.jsonls.setup {
  on_attach = keymaps.on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
}

-- DEBUG
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
--
-- Commands:
-- PyrightOrganizeImports: Organize Imports
-- require('lspconfig').pyright.setup {
--   on_attach = keymaps.on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
-- }

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls
require('lspconfig').vimls.setup {
  on_attach = keymaps.on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
}
vim.g.markdown_fenced_languages = { 'vim', 'help' }

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#luau_lsp
-- require('lspconfig').lua_ls.setup {
--   on_attach = keymaps.on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- DEBUG
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
-- require('lspconfig').bashls.setup {
--   on_attach = keymaps.on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
-- }

-- require("user.lsp.handlers").setup()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab
-- require('lspconfig').texlab.setup{
--   on_attach = keymaps.on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
-- }

-- TODO
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#phpactor
-- https://phpactor.readthedocs.io/en/master/lsp/vim.html
-- require('lspconfig').phpactor.setup{
--   on_attach = keymaps.on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
--   init_options = {
--     ['language_server_phpstan.enabled'] = false,
--     ['language_server_psalm.enabled'] = false,
--   }
-- }

-- TODO https://github.com/LunarVim/Neovim-from-scratch/tree/master/lua/user/lsp
-- require 'user.lsp.configs'
-- require('user.lsp.handlers').setup()
-- require 'user.lsp.null-ls'

return {
  capabilities = capabilities,
  flags = lsp_flags,
}
